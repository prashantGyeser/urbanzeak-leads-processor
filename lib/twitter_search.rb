class TwitterSearch

  def find_tweets(user_id)

    oauth_token = OauthToken.find_by_user_id(user_id)

    # Client initialization
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = oauth_token.oauth_token
      config.access_token_secret = oauth_token.oauth_secret
    end

    user_categories = UserCategory.where(user_id: user_id)

    user_categories.each do |user_category|
      category = Category.find(user_category.category_id)

      keywords_array_hash = Keyword.where( category_id: category.id)
      keywords_array = keywords_array_hash.map { |x| x[:word] }

      keywords_array_grouped_into_8 = keywords_array.each_slice(8).to_a

      keywords_array_grouped_into_8.each do |search_array|
        search_string = search_array.join(" OR ")

        user_cities = UserCity.where(user_id: user_id)

        user_cities.each do |user_city|
          city = City.find(user_city.city_id)

          client.search(search_string, geocode: "#{city.latitude},#{city.longitude},25mi" ).collect do |tweet|
            puts "It is getting into the storage part"
            tweet_hash = {}
            tweet_hash[:tweet_id] = tweet.id
            tweet_hash[:tweet_poster_screen_name] = tweet.user.screen_name
            tweet_hash[:tweet_body] = tweet.text
            if tweet.user.location.to_s.empty?
              tweet_hash[:user_location] = ''
            else
              tweet_hash[:user_location] = tweet.user.location
            end
            tweet_hash[:city_latlon_generate_for] = city.city_name
            tweet_hash[:user_id] = user_id

            UnprocessedLead.create(tweet_hash)

          end
        end
      end

    end


  end



end

#City.create(city_name:"New York", city_code:"NYC", latitude: 40.790434, longitude:-73.305140)
