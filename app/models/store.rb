class Store < OpenStruct
  attr_reader :service, :zip, :total

  def self.service(zip)
    @service ||= BestBuyService.new(zip)
  end

  def self.find_stores(zip)
    response = service(zip).stores
    set_total(response)
    stores  = response[:stores]
    stores.map do |store|
      Store.new(store)
    end
  end

  def self.set_total(response)
    @total = response[:total]
  end

end
