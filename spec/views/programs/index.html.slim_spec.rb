require "rails_helper"
require "capybara/rails"

RSpec.feature "Pages", type: :feature do
  it "adds two numbers" do
    expect(1).to eq(1)
  end
end
