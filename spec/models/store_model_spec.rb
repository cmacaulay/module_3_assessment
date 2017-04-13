require "rails_helper"

describe Store, type: :model do
  describe "#find_stores" do
    it "finds stores" do
      VCR.use_cassette("#find_stores") do
        stores   = Store.find_stores("80202")
        store    = stores.first
        byebug 
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
