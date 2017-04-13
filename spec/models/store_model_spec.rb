require "rails_helper"

describe Store, type: :model do
  describe "#find_stores" do
    VCR.use_cassette("#find_stores") do
      stores   = Store.find_stores("80202")
      byebug 
    end
  end
end
