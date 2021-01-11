class GetTitleTagJob < ActiveJob::Base
    queue_as :default
    
    def perform(url, id)

        #Net::HTTP.get(URI(url)) =~ /<title>(.*?)<\/title>/
        #$1
        begin
            @title=Nokogiri::HTML::Document.parse(HTTParty.get(url).body).title
        rescue => e
            @title = "Error:"+@title
        ensure
            @shorturl = ShortUrl.find(id)
            @shorturl.title=@title
            @shorturl.save
        end
      
    end
end