class BestBuyService
  attr_reader :connection, :zip

  def initialize(zip)
    @connection =  create_connection
    @zip = zip
  end

  def stores
    parse(connection.get("stores(area(#{zip},25))"))
  end

  private

  def create_connection
    Faraday.new(url: "https://api.bestbuy.com/v1") do |faraday|
      faraday.params[:format] = "json"
      faraday.params[:show] = "longName,city,distance,phone,storeType"
      faraday.params[:pageSize] = "10"
      faraday.params[:apiKey] = ENV["BEST_BUY_KEY"]
      faraday.adapter  Faraday.default_adapter
    end
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
