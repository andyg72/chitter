require_relative '../spec_helper'
require_relative '../../app/helpers/user_helper'

include UserActions

feature 'Peeps' do
  
  scenario 'a user who is signed in can post a peep' do
    sign_up
    post_a_peep
    expect(Peep.count).to eq(1)
    expect(page).to have_content('This is a test peep')
  end

  scenario 'only the last ten peeps will appear on the homepage' do
    sign_up
    post_a_peep(11)
    expect(Peep.count).to eq(11)
    [*2..11].each do |n|
      expect(page).to have_content("This is a test peep #{n}")
    end
  end

  scenario 'the ten peeps will be in order of latest first' do
    sign_up
    post_a_peep(10)
    10.times do |n|
      expect(page.all('tr')[n].all('td')[1]).to have_content("This is a test peep #{10-n}")
    end
  end

end