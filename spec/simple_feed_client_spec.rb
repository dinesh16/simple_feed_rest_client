require './lib/simple_feed_client'
require 'json'

describe SimpleFeedClient do 

  let!(:client) {
    client = SimpleFeedClient.new(username: "dinesh16", password: "passwd")
  }

  it "has username" do
    expect(client.username).to eq("dinesh16")
  end

  it "has password" do
    expect(client.password).to eq("passwd")
  end

  it "has type" do
    type = JSON.parse(client.request).first["type"]
    expect(type).to eq("ImageItem")
  end

  it "has image_url" do
    image_url = JSON.parse(client.request).first["image_url"]
    expect(image_url).to eq("http://www.newscientist.com/blogs/shortsharpscience/assets_c/2011/07/SelfMonkey-thumb-600x723-131986.jpg")
  end

  it "has text" do
    text = JSON.parse(client.request).first["text"]
    expect(text).to eq("Hi guys whats up")
  end

  it "has id" do
    id = JSON.parse(client.request).first["id"]
    expect(id).to eq(45)
  end

  it "has created at" do
    created_at = JSON.parse(client.request).first["created_at"]
    expect(created_at).to eq("2014-01-30T23:20:12Z")
  end

  it "has link" do
    link = JSON.parse(client.request).first["link"]
    expect(link).to eq("http://localhost:3000/api/feeds/dinesh16/items/45.json")
  end

  it "has feed link" do
    # pending "do it later"
    feed = JSON.parse(client.request).first["feed"]
    expect(feed["link"]).to eq("http://localhost:3000/api/feeds/dinesh16.json")
  end

  it "has feed name" do
    feed = JSON.parse(client.request).first["feed"]
    expect(feed["name"]).to eq("dinesh16")
  end

  it "has user username" do
    user = JSON.parse(client.request).first["user"]
    expect(user["username"]).to eq("dinesh16")
  end

  it "has user email" do
    user = JSON.parse(client.request).first["user"]
    expect(user["email"]).to eq("dinesh.anthony@surfdome.com")
  end

  it "has user gravatar" do
    user = JSON.parse(client.request).first["user"]
    expect(user["gravatar"]).to eq("http://www.gravatar.com/avatar/55d5e747fc442f493b00fc1179227c5a?s=40")
  end

end
