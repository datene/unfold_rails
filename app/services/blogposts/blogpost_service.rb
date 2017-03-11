require 'open-uri'
require 'crack'
require 'json'

module Blogposts
  class BlogpostService
    def initialize(medium_user)
      @medium_user = medium_user
    end

    def call
      feed = "https://medium.com/feed/#{@medium_user}"
      myXML  = Crack::XML.parse(open(feed))
      myJSON = myXML.to_json
      posts = JSON.parse(myJSON)["rss"]["channel"]["item"]
    end
  end
end