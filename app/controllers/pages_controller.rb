class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @home_text = {
      header: "we unlock creativity",
      content: "allowing people to reach their full potential. 
      We are on a mission to change the world of work - 
      using creative principles, building solid team cultures and collecting gifs along the way"
    }
  end

  def blog
    @posts = Blogposts::BlogpostService.new('unless-io').call
  end

  def contact
    @api_key = ENV["GOOGLE_MAPS_API_KEY"]
  end
end
