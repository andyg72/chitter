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

  scenario 'a user with an incorrecct password cannot log in' do
    sign_up
    visit '/'
    click_button("Sign out") #refactor some of this to a helper
    click_on("Sign in")
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'test1235'
    click_button("Sign in now")
    expect(page).to have_content('Failed to log in with those details, please try again')
  end

  scenario 'a user with an email that hasn\'t been registered cannot log in' do
    visit '/'
    click_on("Sign in")
    fill_in 'email', with: 'new_test@test.com'
    fill_in 'password', with: 'test1234'
    click_button("Sign in now")
    expect(page).to have_content('Failed to log in with those details, please try again')    
  end
  
end