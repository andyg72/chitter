module UserActions

  def sign_up(email = 'test@test.com', name = 'Test Test', username = 'tester',
    password = 'test1234', password_confirmation='test1234')
    visit '/sign_up'
    fill_in 'email', with: email
    fill_in 'name', with: name
    fill_in 'username', with: username
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation
    click_on("Register now")
  end

  def sign_up_and_sign_out(email = 'test@test.com', name = 'Test Test', username = 'tester',
    password = 'test1234', password_confirmation='test1234')
    sign_up(email, name, username, password, password_confirmation)
    visit '/'
    click_button("Sign out")
end

  def sign_in(email = 'test@test.com', password = 'test1234')
    visit '/'
    click_on("Sign in")
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button("Sign in now")
  end

end