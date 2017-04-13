require "rails_helper"

describe BestBuyService do
  describe '#stores' do
    it "finds stores within 25 miles of zip code" do
      service = BestBuyService.new("80202")

      VCR.use_cassette("find_stores") do
        stores  = service.stores[:stores]
        store   = stores.first
        
        expect(stores.count).to eq(10)
        expect(store[:longName]).to eq("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
        expect(store[:city]).to eq("DENVER")
        expect(store[:distance]).to eq(3.45)
        expect(store[:phone]).to eq("303-270-9189")
        expect(store[:storeType]).to eq("Mobile SAS")
      end
    end
  end
end
