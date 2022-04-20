require "rails_helper"
require "capybara/rails"

RSpec.feature "Pages", type: :feature do
  scenario "User creates a new widget" do
    visit root_path
    expect(page).to have_text("Program")
  end
end
