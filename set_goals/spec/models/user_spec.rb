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
    it 'should set the users password digest' do
      
    end
  end

  describe 'is_password?' do
    it 'should return true if the password is correct' do
    end
  end

  describe 'ensure_session_token' do
    it 'should generate a new session token' do
    end
  end
end
