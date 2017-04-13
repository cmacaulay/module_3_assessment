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
end
