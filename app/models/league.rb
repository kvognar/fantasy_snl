# == Schema Information
#
# Table name: leagues
#
#  id                 :integer          not null, primary key
#  name               :string(255)      not null
#  creator_id         :integer          not null
#  created_at         :datetime
#  updated_at         :datetime
#  locked             :boolean          default(FALSE), not null
#  drafting           :boolean          default(FALSE), not null
#  drafting_direction :integer          default(1), not null
#  current_drafter_id :integer          default(1), not null
#  invite_token       :string(255)
#  drafting_order     :text             default([]), is an Array
#

class League < ActiveRecord::Base
  validates :name, :creator_id, presence: true

  belongs_to(
    :creator,
    class_name: "User",
    foreign_key: :creator_id,
    primary_key: :id
  )

  has_many :league_memberships, dependent: :destroy
  has_many :members, through: :league_memberships, source: :member
  has_many :teams
  has_many :draftings, through: :teams, source: :team_memberships

  after_create :add_creator_to_league
  before_validation :set_invite_token, on: :create
  before_validation :initialize_draft, if: :league_has_been_locked

  def available_actors
    #each actor can be drafted twice per league
    result = {}
    Actor.all.each do |actor|
      result[actor.id] = 2
    end

    draftings.each do |drafting|
      result[drafting.actor_id] -= 1
    end
    result

  end

  def current_drafter
    members.find(drafting_order[current_drafter_id])
  end

  def draftings_by_actor
    result = {}
    Actor.all.each do |actor|
      result[actor.id] = 0
    end

    draftings.each do |drafting|
      result[drafting.actor_id] += 1
    end
    result
  end

  def lock
    self.locked = true
    self.save!
    initialize_draft
  end

  def unlock
    self.locked = false
    self.save!
  end

  def next_drafter
    self.current_drafter_id += self.drafting_direction
    if self.drafting_drection == 0 || self.drafting_direction > self.members.size
      self.drafting_direction *= -1
      self.current_drafter_id += self.drafting_direction
    end
    self.save!
  end

  private

  def add_creator_to_league
    self.members << self.creator
  end

  def initialize_draft
    self.drafting = true
    self.drafting_direction = 1
    self.current_drafter_id = 0
    self.drafting_order = self.member_ids.shuffle
  end

  def league_has_been_locked
    self.changed.include?("locked") && self.locked
  end

  def set_invite_token
    self.invite_token = SecureRandom::urlsafe_base64
  end

end
