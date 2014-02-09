require "spec_helper"
describe "user sign in" do
  it "allows users to sign in after they have registered" do
    pending "The behavior of this will change later"
    user = User.create(:name => "julia", :email    => "julia@lala.com",
                       :password => "foolalala")

    visit "/users/sign_in"
    fill_in "Email",    :with => "julia@lala.com"
    fill_in "Password", :with => "foolalala"

    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end
end
