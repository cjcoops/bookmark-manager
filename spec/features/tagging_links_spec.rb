RSpec.feature "Tagging" do
  scenario "Adding tag to link" do
    visit "/links/new"
    fill_in("url", with: "https://github.com/")
    fill_in("title", with: "Github")
    fill_in("tags", with: "Cats")
    click_button("Save")
    link = Link.first
    expect(link.tags.map(&:name)).to include("Cats")
  end
end
