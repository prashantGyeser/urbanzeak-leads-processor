require 'data_parser'

RSpec.describe DataParser do

  it "should return a hash of values from a row" do
    row = ["tag:search.twitter.com,2005:491942044055924737",
           "https://pbs.twimg.com/profile_images/461513162257207297/4apSHd2A_normal.png",
           "Don't dance around the perimeter of the person you want to be. Step in fully and completely. #miraclesnow #todatruth"]

    expected_hash = {
        tweet_id: "tag:search.twitter.com,2005:491942044055924737",
        tweet_poster_profile_link: "https://pbs.twimg.com/profile_images/461513162257207297/4apSHd2A_normal.png",
        tweet_body: "Don't dance around the perimeter of the person you want to be. Step in fully and completely. #miraclesnow #todatruth"
    }

    expect(DataParser.convert_row_into_hash(row)).to eq expected_hash

  end



end