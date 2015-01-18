require_relative '../spec_helper'
require_relative '../../app/helpers/user_helper'

include UserActions

feature 'Replies' do

  scenario 'a user can reply to a peep when logged in' do
    sign_up
    post_a_peep(3)
    expect(page).to have_content('reply')
    page.all(:link,"reply")[0].click
    expect(page).to have_content('Compose your reply')
    fill_in 'reply_text', with: "This is a test reply"
    click_on("Post your reply")
    expect(Reply.count).to eq(1)
    expect(page).to have_content('This is a test reply')
  end

end