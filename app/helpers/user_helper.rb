module UserActions

  def sign_up(email = 'test@test.com', name = 'Test Test', username = 'tester',
    password = 'test1234', password_confirmation='test1234')
    visit '/sign_up'
    fill_in 'email', with: email
    fill_in 'name', with: name
    fill_in 'username', with: username
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation
    click_on("Sign up")
  end

end