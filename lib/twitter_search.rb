class TwitterSearch

  def find_tweets()

    # Client initialization
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "P1akA2LS1B6VHWiPzfyhDh24u"
      config.consumer_secret     = "eOuMGTiqXkqalOdGxYdxZiCGL73H5mc43LlswxHsfW3FRIqRoj"
      config.access_token        = "2431831016-Tps58cf93MX9uW0n1GX6zXTNzrsYgOj9BIwJoDu"
      config.access_token_secret = "W4mKPVbHybmYgumLzN7RFrCwTyLJoI1I0TIGr5ubsu3Rl"
    end


    client.search("sushi", :result_type => "recent").collect do |tweet|
      puts tweet.inspect
    end

  end


end