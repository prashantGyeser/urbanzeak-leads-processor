class TweetCollector

  include Sidekiq::Worker

  def perform(twitter_oauth_key_id)
    twitter_oauth_key = TwitterOauthKey.find(twitter_oauth_key_id)
    puts "Adding a record..."

    values_to_insert = ["'#{Time.now}'::timestamp","'#{Time.now}'::timestamp","some awesome name","some image url","some message","sopme location"]

    sql_query = "INSERT INTO unprocessed_leads (created_at,updated_at,tweet_poster_screen_name,tweet_user_image,tweet_body,user_location) VALUES #{values_to_insert}"


    ActiveRecord::Base.connection.execute sql_query


  end

end

#
#
# inserts = []
#
# loop around your data do |line|
#   inserts.push("('#{Time.now}'::timestamp, \
# '#{Time.now}'::timestamp,'#{line[0]}','#{line[1]}', \
#                #{current_user.id})")
# end
#
#
# sql_query = "INSERT INTO table_name (created_at,updated_at,attribute1, attribute2,user_id,) VALUES #{inserts.join(", ")}"
#
# ActiveRecord::Base.connection.execute sql_query