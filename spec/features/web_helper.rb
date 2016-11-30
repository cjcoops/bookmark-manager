def sign_up
  visit "/users/new"
  fill_in("email", with: "chrixs99@gmail.com")
  fill_in("password", with: "1234")
end
