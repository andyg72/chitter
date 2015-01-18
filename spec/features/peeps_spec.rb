require_relative '../spec_helper'
require_relative '../../app/helpers/user_helper'

include UserActions

feature 'Peeps' do
  
  scenario 'a user who is signed in can post a peep' do
    sign_up
    click_button("Compose a Peep")
    fill_in 'peep_text', with: 'This is a test peep'
    click_on("Post your peep")
    expect(Peep.count).to eq(1)
    expect(page).to have_content('This is a test peep')
  end

end