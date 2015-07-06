require "rails_helper"

describe "Signing up" do
  it "allows a user to sign up for site and creates user object in the database" do
    expect(User.count).to eq(0)

    visit "/"
    expect(page).to have_content("Sign Up")
    click_link "Sign Up"

    fill_in "Email",            with: "bob2@bob.com"
    fill_in "Password",         with: "bobpass"
    fill_in "Password (again)", with: "bobpass"
    click_button "Sign Up"

    expect(User.count).to eq(1)
  end
end
