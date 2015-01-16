require_relative '../spec_helper'
require_relative '../../app/helpers/user_helper'

include UserActions

feature 'User Sign Up' do
   
  scenario 'a unique user is able to sign-up to a chitter account' do
    expect(User.count).to eq(0)
    sign_up
    expect(User.count).to eq(1)
    expect(User.first.email).to eq("test@test.com")
    expect(page).to have_content('You are currently signed in as tester')
  end

  scenario 'a user using the same email address as a previously registered user cannot sign up' do
    expect(User.count).to eq(0)
    sign_up
    expect(User.count).to eq(1)    
    sign_up('test@test.com', 'New Name', 'New Username', 'test1234', 'test1234')
    expect(User.count).to eq(1)
    expect(page).to have_content('This email already has an account')    
  end

  scenario 'a user using the same username as previously registered user cannot sign up' do
    expect(User.count).to eq(0)
    sign_up
    expect(User.count).to eq(1)    
    sign_up('new@test.com', 'New Name', 'tester', 'test1234', 'test1234')
    expect(User.count).to eq(1)
    expect(page).to have_content('This username already has an account')    
  end

end

