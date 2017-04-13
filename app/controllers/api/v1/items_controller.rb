class Api::V1::ItemsController < BaseController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(parms[:id])
  end
  
end
