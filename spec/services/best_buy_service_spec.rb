require "rails_helper"

describe BestBuyService do
  describe '#stores' do
    it "finds stores within 25 miles of zip code" do
      service = BestBuyService.new("80202")

      VCR.user_cassette("find_stores") do
        stores  = service.stores
        store   = stores.first

        

      end
    end
  end
end
