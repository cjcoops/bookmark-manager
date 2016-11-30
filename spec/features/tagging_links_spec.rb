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

  scenario "Adding multiple tags to a link" do
    visit "/links/new"
    fill_in("url", with: "https://cathub.com/")
    fill_in("title", with: "Cathub")
    fill_in("tags", with: "Cats Dogs")
    click_button("Save")
    link = Link.first
    expect(link.tags.map(&:name)).to include("Cats", "Dogs")
  end
end
