require_relative '../spec_helper'
require_relative '../../app/helpers/user_helper'

include UserActions

feature 'User Sign Out and In' do 

  scenario 'a user who has logged in or registered should be able to sign out' do
    sign_up_and_sign_out
    expect(page).not_to have_content('You are currently signed in as tester')
    expect(page).to have_content('Goodbye, see you again soon!')
  end

  scenario 'a user can log in' do
    sign_up_and_sign_out
    sign_in(email = 'test@test.com', password = 'test1234')
    expect(page).to have_content('You are currently signed in as tester') 
  end

  scenario 'a user with an incorrecct password cannot log in' do
    sign_up_and_sign_out
    sign_in(email = 'test@test.com', password = 'test1235')    
    expect(page).to have_content('Failed to log in with those details, please try again')
  end

  scenario 'a user with an email that hasn\'t been registered cannot log in' do
    visit '/'
    sign_in(email = 'new_test@test.com', password = 'test1234')
    expect(page).to have_content('Failed to log in with those details, please try again')    
  end

  scenario 'a user can log out' do
    sign_up_and_sign_out
    expect(page).to have_content('Goodbye, see you again soon!')
  end
  
end