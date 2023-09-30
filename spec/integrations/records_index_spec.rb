require 'rails_helper'

RSpec.describe 'Records#Index', type: :feature do
  user = User.create(name: 'User One', email: 'userone@example.com', password: '111111')
  before(:all) do
    visit new_user_registration_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password
    click_button 'Next'
    sleep 1
  end

  before(:each) do
    visit groups_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log In'
    sleep 1
  end
end
