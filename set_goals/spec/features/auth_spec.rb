require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'Sign up Here!'
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'testing_username'
      fill_in 'password', with: 'biscuits'
      click_on 'Create User'
    end

    scenario 'redirects to user profile page after sign-up' do
      expect(page).to have_content 'Welcome, testing_username'
    end
  end
end

feature 'logging in' do
  before(:each) do
    visit new_user_url
    fill_in 'username', with: 'logintest'
    fill_in 'password', with: 'applepie'
    save_and_open_page
    click_on 'Create User'
  end

  scenario 'shows username on the homepage after login' do
    expect(page).to have_content "Welcome, logintest"
  end
end

feature 'logging out' do
  before(:each) do
    visit new_user_url
    fill_in 'username', with: 'testing_username'
    fill_in 'password', with: 'biscuits'
    click_on 'Create User'
    click_on 'Logout!'
  end

  scenario 'redirects user to the signup page' do
    expect(page).to have_content 'Sign In'
  end

  scenario 'doesn\'t show username on the homepage after logout' do
  end

end
