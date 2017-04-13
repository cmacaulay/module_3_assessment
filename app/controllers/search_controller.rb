class SearchController < ApplicationController
  def index
    @zip = params[:query]
    @stores = Store.find_stores(@zip)
    @total = Store.total
  end
end
