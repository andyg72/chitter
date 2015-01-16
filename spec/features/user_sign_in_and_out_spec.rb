require_relative '../spec_helper'
require_relative '../../app/helpers/user_helper'

include UserActions

feature 'User Sign Out and In' do 

  scenario 'a user who has logged in or registered should be able to sign out' do
    sign_up
    visit '/'
    click_button("Sign out")
    expect(page).not_to have_content('You are currently signed in as tester')
    expect(page).to have_content('Goodbye, see you again soon!')
  end

  scenario 'a user can log in' do
    sign_up
    visit '/'
    click_button("Sign out")
    click_on("Sign in")
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'test1234'
    click_button("Sign in now")
    expect(page).to have_content('You are currently signed in as tester') 
  end

  
end