require 'rails_helper'

describe "items API" do
  it "sends a list of items" do
    create_list(:item, 4)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(4)
  end

  it "can get one item by its id" do
    item = create(:item)
    id   = item.id

    get "/api/v1/items/#{id}"

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json).to have_key "id"
    expect(json).to have_key "name"
    expect(json).to have_key "description"
    expect(json).to have_key "image_url"

    expect(item["id"]).to eq(id)
    expect(item["name"]).to eq(item.name)
    expect(item["description"]).to eq("description")
    expect(item["image_url"]).to eq(item.image_url)
  end

  it "can destroy an item" do
    item = create(:item)
    id   = item.id

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{id}"

    expect(response).to be_success
    expect(Item.count).to eq(0)
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "can create a new item" do
    item_params = { name: "Moon Boots", description: "The Fluffiest", image_url: "https://images.duckduckgo.com/iu/?u=http%3A%2F%2Fimages.cavesclothes.co.uk%2Fimages%2Fproducts%2Fzoom%2F1322305775-28869800.jpg&f=1"}

    post "/api/v1/items",  {item: item_params}
    item = Item.last

    assert_response :success
    expect(response).to be_success
    expect(item.name).to eq(item_params[:name])
  end
end
