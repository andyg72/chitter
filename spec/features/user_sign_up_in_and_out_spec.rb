require_relative '../spec_helper'

# include Helpers

feature 'User Sign Up' do
   
  scenario 'a unique user is able to sign-up to a chitter account' do
    expect(User.count).to eq(0)
    visit '/sign_up'
    fill_in 'email', with: 'test@test.com'
    fill_in 'name', with: 'Test Test'
    fill_in 'username', with: 'tester'
    fill_in 'password', with: 'test1234'
    fill_in 'password_confirmation', with: 'test1234'
    click_on("Sign up")
    expect(User.count).to eq(1)
    expect(User.first.email).to eq("test@test.com")
  end

end

