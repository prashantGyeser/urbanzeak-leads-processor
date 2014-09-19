require 'datasift_calls'

class DatasiftQuery

  def generate(keywords, city)
    keywords_query = DatasiftQuery.get_query_for_keywords(keywords)
    city_query = DatasiftQuery.get_query_for_city(city)

    query = "#{keywords_query}" + " AND " + "#{city_query}"

    datasift_calls = DatasiftCalls.new

    if datasift_calls.valid_csdl?(query)
      return query
    else
      return false
    end

  end

  def self.get_query_for_keywords(keywords_string)
    keywords_array = keywords_string.split(',').map(&:strip)

    query = ''
    keywords_tweet_should_contains_query = ''
    total_keywords = keywords_array.count

    keywords_array.each_with_index do |keyword, index|
      keyword_query = 'twitter.text contains_any ' + '"' + keyword + '"'
      if (index + 1) >= total_keywords
        keywords_tweet_should_contains_query = keywords_tweet_should_contains_query +  keyword_query + ' )'
      else
        if keywords_tweet_should_contains_query.empty?
          keywords_tweet_should_contains_query = '( ' + keyword_query + ' OR '
        else
          keywords_tweet_should_contains_query = keywords_tweet_should_contains_query + keyword_query + ' OR '
        end
      end
    end

    return keywords_tweet_should_contains_query

  end

  def self.get_query_for_city(city)
    profile_location = 'twitter.user.location contains_any "' + city + '" OR '
    places_location = 'twitter.place.full_name contains_any "' + city + '" OR '

    lat_long = DatasiftQuery.get_lat_lon_for_city(city)
    lat_long_string = lat_long.join(',')
    geolocation = lat_long_string + ':20'

    geo_location = 'twitter.geo geo_radius "' + geolocation + '"'

    return '( ' + profile_location + places_location + geo_location + ' )'
  end

  def self.get_lat_lon_for_city(city)
    return Geocoder.coordinates(city)
  end


end