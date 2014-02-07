require "spec_helper"

describe "user registration" do
  it "allows new users to register with an email address and password" do
    visit "/users/sign_up"
    fill_in "user_name",                 :with => "julia"
    fill_in "user_email",                 :with => "julia@lala.com"
    fill_in "user_password",              :with => "foolalala"
    fill_in "user_password_confirmation", :with => "foolalala"
    click_button "Sign up"
    page.should have_content("Sign out")
  end
end
