module ShortUrlUtility

    # AllowedChars - It defines the charcaters we want to use in generated shorturl
    # Usually, it should contain letters a - z and numbers 0 - 9
    # You can use special characters, but they should be allowed ones in a url
    # The maximum length of AllowwedChars string is 36. You cannot define a string more than 36 for AllowsChars
    # The usual rule is bigger the length of Allowedchars string, smaller will be the size of shorturl generated
    # At maximum size i.e. 36, mathematically it can generate 2^36 - 1 Urls
    
    AllowedChars = "abcdefghijklmnopqrstuvwxyz"

    def CalculateShortUrl(id)
      @converted_string=id.to_s(AllowedChars.length)
      @short_url_string=""
      for pos in 0...@converted_string.length
        @asc_val=@converted_string[pos].ord
        @index_val=0
        if @asc_val >=48 and @asc_val <= 57
            @index_val = @asc_val - 48
        else 
            @index_val = @asc_val - 97 + 10
        end
        @short_url_string=@short_url_string + AllowedChars[@index_val]
      end
      @short_url_string
    end

end
