# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) {FactoryBot.build(:user)}

  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}

    it 'should validate password is 6 characters minimum' do
      user1 = User.create(username: "stelladoge1", password: "1234")
      expect(user1.errors[:password]).to eq(["is too short (minimum is 6 characters)"])
    end

  end

  describe '::find_by_credentials' do
    it 'should find a user by credentials' do
      expect(User.find_by_credentials("stelladoge1", "123456").username).to eq("stelladoge1")
    end

    it 'should not return a user with incorrect credentials' do
      expect(User.find_by_credentials("asdf", "123456")).to be_nil
    end
  end

  describe '::generate_session_token' do
    sess_token = User.generate_session_token
    it 'should generate a new session token' do
      expect(sess_token.length).to be(22)
    end
  end

  describe 'reset_session_token!' do
    it 'should reset a users session token' do
      old_sess_token = User.find(1).session_token
      stella = User.first
      stella.reset_session_token!

      expect(old_sess_token).not_to eq(stella.session_token)
    end
  end

  describe 'password=' do
    subject(:user) {FactoryBot.build(:user)}

    it 'should set the users password digest' do
      expect(user.password=("password123")).to eq("password123")
    end
  end

  describe 'is_password?' do
    it 'should return false if the password is incorrect' do
      u1 = User.first
      expect(u1.is_password?("asdfasdf")).to be false
    end
  end

  describe 'ensure_session_token' do
    capy1 = FactoryBot.build(:user)
    # Comment in line below if you need to add a User to the db for testing
    # capy1 = User.create(username: "capybara!", password:"iamcute")
    it 'ensure that a user is saved with a session token' do
      expect(capy1.session_token).not_to be nil
    end
  end
end
