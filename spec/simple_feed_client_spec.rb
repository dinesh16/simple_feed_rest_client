require './lib/simple_feed_client'
require 'json'
require 'vcr'

# This will save the response in a file, so you do not have to resend request again and again 
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr'
  c.hook_into :webmock # or :fakeweb
end

describe SimpleFeedClient do 

  let!(:response) do
    VCR.use_cassette('synopsis') do
      client = SimpleFeedClient.new(username: "dinesh16", password: "passwd")
      response = JSON.parse(client.request).first
    end
  end

  it "has type" do
    expect(response["type"]).to eq("ImageItem")
  end

  it "has image_url" do
    expect(response["image_url"]).to eq("http://www.newscientist.com/blogs/shortsharpscience/assets_c/2011/07/SelfMonkey-thumb-600x723-131986.jpg")
  end

  it "has text" do
    expect(response["text"]).to eq("Hi guys whats up")
  end

  it "has id" do
    expect(response["id"]).to eq(45)
  end

  it "has created at" do
    expect(response["created_at"]).to eq("2014-01-30T23:20:12Z")
  end

  it "has link" do
    expect(response["link"]).to eq("http://localhost:3000/api/feeds/dinesh16/items/45.json")
  end

  it "has feed link" do
    feed = response["feed"]
    expect(feed["link"]).to eq("http://localhost:3000/api/feeds/dinesh16.json")
  end

  it "has feed name" do
    feed = response["feed"]
    expect(feed["name"]).to eq("dinesh16")
  end

  it "has user username" do
    user = response["user"]
    expect(user["username"]).to eq("dinesh16")
  end

  it "has user email" do
    user = response["user"]
    expect(user["email"]).to eq("dinesh.anthony@surfdome.com")
  end

  it "has user gravatar" do
    user = response["user"]
    expect(user["gravatar"]).to eq("http://www.gravatar.com/avatar/55d5e747fc442f493b00fc1179227c5a?s=40")
  end

end
