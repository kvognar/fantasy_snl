# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  username      :string(255)      not null
#  created_at    :datetime
#  updated_at    :datetime
#  password_hash :string(255)      not null
#  session_token :string(255)      not null
#  is_admin      :boolean          default(FALSE), not null
#  email         :string(255)
#

require 'spec_helper'


describe User do
  before :each do
    @user = create(:user, username: "the rubin", password: "mxyzptlk")
    @other_user = create(:user, username: "som")
  end
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
  it { should validate_presence_of :password_hash }
  it { should have_many :league_memberships }
  it { should have_many :teams }
  it { should have_many :leagues }
  it { should have_many :created_leagues }
  it { should have_many :writeups }

  describe '#find_by_credentials' do
    it 'should find a user by their password' do
      expect(User.find_by_credentials(username: 'the rubin', password: 'mxyzptlk')).to eq(@user)
    end

    it 'should return nil if the username or password is wrong' do
      expect(User.find_by_credentials(username: 'humbug', password: 'nonsense')).to eq(nil)
      expect(User.find_by_credentials(username: 'the rubin', password: 'kltpzyxm')).to eq(nil)
    end
  end

  describe '#resets_session_token!' do
    it "resets the user's session token" do
      token = @user.session_token
      @user.reset_session_token!
      expect(@user.session_token).to_not eq(token)
    end
  end


end
