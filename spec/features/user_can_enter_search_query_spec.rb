require "rails_helper"

describe "search bar on root page" do
  it "user is able to enter query" do
    visit "/"

    fill_in "query", with: "80202"
    click_on "Find"

    expect(current_path).to eq("/search")
  end
end