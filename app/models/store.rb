class Store < OpenStruct
  attr_reader :service, :zip, :total, :response

  def self.service(zip)
    @service ||= BestBuyService.new(zip)
  end

  def self.find_stores(zip)
    @response = service(zip).stores
    stores  = @response[:stores]
    stores.map do |store|
      Store.new(store)
    end
  end

  def self.total
    @total = @response[:total]
  end

end
