class Api::V1::ItemsController < API::V1::BaseController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
     item = Item.create(item_params)
     if item.save
       render json: Item.last
     end
  end

  def destroy
    Item.delete(params[:id])
    render json: {}, status: :no_content
  end

  private

  def item_params
    params.required(:item).permit(:name, :description, :image_url)
  end
end
