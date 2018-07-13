require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'create' do
    it 'logs in user upon successful creation' do
      post :create, params: {user: {username: "robfarb", password: "thisisfun"}}
      rob = User.find_by_credentials("robfarb", "thisisfun")
      expect(rob.session_token).to eq(session[:session_token])
    end

    it 'redirects to new user page with invalid params' do
      post :create, params: {user: {username: "asdf", password: ""}}
      expect(response).to redirect_to(new_user_url)
    end
  end

  describe 'show' do
    
  end

  describe 'index' do

  end
end
