class ShorturlController < ApplicationController
    include ShortUrlUtility

   
    def show
      @shorturl = ShortUrl.find_by(short_url: params[:id])
    end
  
  
  
  
  
  end
  