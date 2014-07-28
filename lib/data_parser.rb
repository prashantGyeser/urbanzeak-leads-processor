class DataParser

  def self.convert_row_into_hash(row)
    parsed_hash = {}

    parsed_hash[:tweet_poster_screen_name] = row[0]
    parsed_hash[:tweet_user_image] = row[1]
    parsed_hash[:tweet_body] = row[2]
    parsed_hash[:gnip_matching_rules] = row[3]
    parsed_hash[:user_location] = row[4]
    parsed_hash[:tweet_poster_profile_link] = 'https://twitter.com/' + parsed_hash[:tweet_poster_screen_name]

    return parsed_hash
  end

end