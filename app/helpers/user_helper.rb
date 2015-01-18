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

  def post_a_peep(n = 1, peep_text = 'This is a test peep')
    n.times do |i|
      click_on("Compose a Peep")
      fill_in 'peep_text', with: peep_text+" #{i+1}"
      click_on('Post your peep')
    end
  end

  def post_a_reply(n = 1, reply_text = 'This is a test reply')
    n.times do |i|
      click_on('reply')
      fill_in 'reply_text', with: reply_text+" #{i+1}"
      click_on('Post your reply')
    end
  end

end