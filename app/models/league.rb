# == Schema Information
#
# Table name: leagues
#
#  id                    :integer          not null, primary key
#  name                  :string(255)      not null
#  creator_id            :integer          not null
#  created_at            :datetime
#  updated_at            :datetime
#  locked                :boolean          default(FALSE), not null
#  drafting              :boolean          default(FALSE), not null
#  drafting_direction    :integer          default(0), not null
#  current_drafter_index :integer          default(1), not null
#  invite_token          :string(255)
#  drafting_order        :text             default([]), is an Array
#  season_id             :integer          default(1), not null
#

class League < ActiveRecord::Base
  validates :name, :creator_id, :season_id, presence: true

  belongs_to(
    :creator,
    class_name: "User",
    foreign_key: :creator_id,
    primary_key: :id
  )
  belongs_to :season

  has_many :league_memberships, dependent: :destroy
  has_many :members, through: :league_memberships, source: :member
  has_many :teams, dependent: :destroy
  has_many :draftings, through: :teams, source: :team_memberships

  after_create :add_creator_to_league
  before_create :ensure_season
  before_validation :set_invite_token, on: :create
  before_validation :initialize_draft, if: :league_has_been_locked

  def available_actors
    #each actor can be drafted twice per league
    result = Hash[Actor.by_season(self.season).map { |actor| [actor, 2] }]

    draftings.each do |drafting|
      result[drafting.actor] -= 1
    end
    result

  end

  def current_drafter
    members.find(drafting_order[current_drafter_index])
  end

  def members_in_drafting_order
    drafting_order.map { |i| User.find(i) }
  end


  def next_drafter
    self.current_drafter_index += self.drafting_direction
    if self.current_drafter_index == -1 || self.current_drafter_index == self.members.size
      self.drafting_direction *= -1
      self.current_drafter_index += self.drafting_direction
    end
    self.save!
    end_drafting_if_finished
  end

  def end_drafting_if_finished
    if drafting_team.present? && drafting_team.members.size == 4
      self.update_attributes(drafting: false)
    end
  end

  def drafting_team
    Team.find_by(owner: current_drafter, league_id: self.id)
  end

  private

  def add_creator_to_league
    self.members << self.creator
  end

  def ensure_season
    self.season_id = Season.active.last.id unless self.season && self.season.is_active?
  end

  def initialize_draft
    self.drafting = true
    self.drafting_direction = 1
    self.current_drafter_index = 0
    self.drafting_order = self.member_ids.shuffle
    UserMailer.drafting_turn_email(self.current_drafter, self).deliver
  end

  def league_has_been_locked
    self.changed.include?("locked") && self.locked
  end

  def set_invite_token
    self.invite_token = SecureRandom::urlsafe_base64
  end

end
