class Store < OpenStruct
  attr_reader :service, :zip

  def self.service(zip)
    @service ||= BestBuyService.new(zip)
  end

  def self.find_stores(zip)
    stores = service(zip).stores[:stores]
    stores.map do |store|
      Store.new(store)
    end
    set_total
  end

  def set_total 
  end

end
