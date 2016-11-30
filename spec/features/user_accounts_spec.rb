require_relative 'web_helper'

RSpec.feature "User Accounts" do

  scenario "checks that /links shows a welcome message" do
    sign_up
    expect(page).to have_content('Welcome chrixs99@gmail.com')
  end

  scenario "checks the user count increases by 1" do
    expect {sign_up}.to change(User, :count).by(1)
  end

  scenario "email has been added" do
    expect(User.first.email). to eq "chrixs99@gmail.com"
  end
end
