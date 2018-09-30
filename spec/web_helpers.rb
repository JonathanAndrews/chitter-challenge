def logged_on
  User.create(email: "test@email.com", password: "password12345", username: "AbagnaleF", name: "Frank Abagnale")
  visit "/users/sign_in"
  fill_in("username", with: "AbagnaleF")
  fill_in("password", with: "password12345")
  click_button "Sign In"
end