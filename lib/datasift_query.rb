require 'datasift_calls'

class DatasiftQuery

  def self.get_query_for_keyword_match(keywords_string)
    keywords_array = keywords_string.split(',').map(&:strip)

    query = ''
    keywords_tweet_should_contains_query = ''
    total_keywords = keywords_array.count


    keywords_array.each_with_index do |keyword, index|
      if (index + 1) >= total_keywords
        keywords_tweet_should_contains_query = keywords_tweet_should_contains_query + "twitter.text contains_any '#{keyword}' )"
      else
        if keywords_tweet_should_contains_query.empty?
          keywords_tweet_should_contains_query = "( twitter.text contains_any '#{keyword}' OR "
        else
          keywords_tweet_should_contains_query = keywords_tweet_should_contains_query + "twitter.text contains_any '#{keyword}' OR "
        end
      end
    end

    return keywords_tweet_should_contains_query

  end

  def self.get_query_for_city(city)
    profile_location = "twitter.user.location contains_any '#{city}' OR "
    places_location = "twitter.place.full_name contains_any '#{city}' OR "

    lat_long = DatasiftQuery.get_lat_lon_for_city(city)
    lat_long_string = lat_long.join(',')
    geolocation = lat_long_string + ':20'

    geo_location = "twitter.geo geo_radius '#{geolocation}'"

    return profile_location + places_location + geo_location
  end

  def self.get_lat_lon_for_city(city)
    return Geocoder.coordinates(city)
  end


end