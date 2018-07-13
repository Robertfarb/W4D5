require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    it 'logs in user upon successful creation' do
      post :create, params: {user: {username: "robfarb", password: "thisisfun"}}
      rob = User.find_by_credentials("robfarb", "thisisfun")
      expect(rob.session_token).to eq(session[:session_token])
    end

    it 'redirects to new user page with invalid params' do
      post :create, params: {user: {username: "asdf"}}
      expect(response).to render_template(:new)
    end

    it 'redirects us to users page upn creation' do
      post :create, params: {user: {username: "itstheweekend", password:"finally!"}}
      wknd = User.find_by_credentials("itstheweekend", "finally!")
      expect(response).to redirect_to(user_url(wknd))
    end
  end


  describe 'GET #index' do
    it 'shows a list of all the users' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
