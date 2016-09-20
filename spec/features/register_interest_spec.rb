require "rails_helper"

feature "Register interest" do
  scenario "successfully" do
    visit root_path

    fill_in "Email", with: "foo@bar.com"
    click_on "I want in."

    expect(page).to have_content t("interest.create.success")
    expect(Interest.last.email).to eq("foo@bar.com")
  end

  scenario "unsuccessfully" do
    visit root_path

    click_on "I want in."

    expect(page).to have_content t("interest.create.failure")
  end
end
