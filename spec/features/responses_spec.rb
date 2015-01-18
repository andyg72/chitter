require_relative '../spec_helper'
require_relative '../../app/helpers/user_helper'

include UserActions

feature 'Responses' do

  scenario 'a user can respond to a peep when logged in' do
    sign_up
    post_a_peep(3)
    expect(page).to have_content('respond')
    page.all(:link,"respond")[0].click
    expect(page).to have_content('enter your response')
  end

end