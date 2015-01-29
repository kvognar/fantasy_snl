# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

  validates :username, :password_hash, :session_token,  presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token

  has_many :league_memberships, foreign_key: :member_id, dependent: :destroy
  has_many :teams, dependent: :destroy, foreign_key: :owner_id
  has_many :leagues, through: :league_memberships, source: :league

  attr_accessor :password

  def self.find_by_credentials(creds)
    user = User.find_by_username(creds[:username])
    user && user.is_password?(creds[:password]) ? user : nil
  end

  def password=(password)
    @password=password
    self.password_hash = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_hash).is_password?(password)
  end

  def reset_session_token!
    self.session_token = generate_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= generate_token
  end

  def generate_token
    SecureRandom::urlsafe_base64(16)
  end


end
