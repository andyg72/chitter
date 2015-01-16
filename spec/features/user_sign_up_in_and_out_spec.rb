# require

# include Helpers

feature 'a user is able to sign-up to a chitter account' do
  visit '/'
  click_button('Sign up')
  fill_in 'email', with: 'test@test.com'
  fill_in 'name', with: 'Test Test'
  fill_in 'username', with: 'tester'
  fill_in 'password', with: 'test1234'
  fill_in 'password_confirmation', with: 'test1234'
  click_button('Sign up')
  # expect database record to be 1 more than when we started
end

