require_relative '../spec_helper'
require_relative '../../app/helpers/user_helper'

include UserActions

feature 'User Sign Up' do
   
  scenario 'a unique user is able to sign-up to a chitter account' do
    expect(User.count).to eq(0)
    sign_up
    expect(User.count).to eq(1)
    expect(User.first.email).to eq("test@test.com")
  end

  scenario 'a user using the same email address as a previously registered user cannot sign up' do

  end

end

