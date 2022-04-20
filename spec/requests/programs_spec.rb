require "rails_helper"

describe "program requests" do
  it "GET root renders program" do
    get root_path
    expect(response).to be_successful
    expect(response.body).to include("Program")
  end
end
