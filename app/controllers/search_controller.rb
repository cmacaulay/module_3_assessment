class SearchController < ApplicationController
  def index
    @stores = Store.find_stores(params[:query])
    byebug 
  end
end
