require "rails_helper"

describe "search bar on root page" do
  it "user is able to enter query" do
    VCR.use_cassette("user_finds_stores") do

      visit "/"

      fill_in "query", with: "80202"
      click_on "Find"

      expect(current_path).to eq("/search")
      expect(page).to have_content "80202"
      expect(page).to have_content "16 Total Stores"
    end
  end
end
