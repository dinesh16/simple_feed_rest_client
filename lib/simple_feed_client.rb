require 'rest_client'

class SimpleFeedClient

  attr_reader :username, :password

  def initialize(params)
    @username = params[:username]
    @password = params[:password]
  end

  def request
    # require 'pry'
    # binding.pry
    RestClient::Request.execute(:url => 'http://localhost:3000/api/feeds/dinesh16/items.json', 
                                :method => :get, 
                                :user =>@username, 
                                :password => @password)
  end

  class Feed

  end

  class User

  end

end
