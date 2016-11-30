RSpec.feature "filter by tags" do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.cathub.com', title: 'Cathub', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubbles.com', title: 'Bubbles', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario "link with bubbles tag" do
    visit "/tags/bubbles"
    expect(page.status_code).to eq(200)

    within 'ul#links' do
      expect(page).to have_content "Cathub"
      expect(page).to have_content "Bubbles"
      expect(page).not_to have_content "Makers Academy"
      expect(page).not_to have_content "Google"
    end
  end


end
