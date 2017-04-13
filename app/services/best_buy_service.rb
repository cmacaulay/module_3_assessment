class BestBuyService
  attr_reader :connection, :url

  def initialize(zip)
    @connection = create_connection
    @url = "https://api.bestbuy.com/v1/stores(area(#{zip},25))"
  end

  def stores
    byebug 
    parse(connection)
  end

  private

  def create_connection
    Faraday.new(url: url) do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:format] = "json"
      faraday.params[:show] = "longName,city,distance,phone,storeType"
      faraday.params[:pageSize] = "10"
      faraday.params[:apiKey] = ENV["BEST_BUY_KEY"]
    end
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
