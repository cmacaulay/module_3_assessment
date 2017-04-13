class Api::V1::ItemsController < API::V1::BaseController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    render json: Item.create(item_params)
    # if
    # redirect_to api_vi_item_path(Item.last)
  end

  def destroy
    Item.delete(params[:id])
  end

  private

  def item_params
    params.required(:item).permit(:name, :description, :image_url)
  end
end
