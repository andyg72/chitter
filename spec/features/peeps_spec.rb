require_relative '../spec_helper'
require_relative '../../app/helpers/user_helper'

include UserActions

feature 'Peeps' do
  
  scenario 'a user who is signed in can post a peep' do
    sign_up
    click_button("Compose a Peep")
    fill_in 'peep_text', with: 'This is a peep'
    click_on("Post your peep")
    expect(Peep.count).to eq(1)
    expect(page).to have_content('This is a peep')
  end

  xscenario ' a user who is not signed in gets redirected to sign in or sign up if they try to post' do 
    expect(page).to have_content('You must either sign in or sign up before you peep')
  end

end