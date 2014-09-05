require 'datasift_calls'

class Dashboard::DatsiftController < Dashboard::ApplicationController
  def subscriptions

    @subscriptions = {:data=>{:subscriptions=>[{:id=>"65266471b0039dde2c340e94a09946a5", :output_type=>"s3", :name=>"Pizza spaghetti chicago ", :created_at=>1409838035, :user_id=>37691, :hash=>"58b8d96f081c476bcc297f3fb2e33b3c", :hash_type=>"stream", :output_params=>{:format=>"json_meta", :delivery_frequency=>0, :bucket=>"datasift_output", :file_prefix=>"datasift", :acl=>"private", :directory=>"data"}, :status=>"active", :last_request=>nil, :last_success=>1409899318, :remaining_bytes=>nil, :lost_data=>false, :start=>1409838035, :end=>nil}, {:id=>"5bea16d441928f2242ecb72bd7b86843", :output_type=>"s3", :name=>"Pizza spaghetti San Jose", :created_at=>1409837842, :user_id=>37691, :hash=>"339cde4eccd3ba0733d618aebbd649e8", :hash_type=>"stream", :output_params=>{:format=>"json_meta", :delivery_frequency=>0, :bucket=>"datasift_output", :file_prefix=>"datasift", :acl=>"private", :directory=>"data"}, :status=>"active", :last_request=>nil, :last_success=>1409889991, :remaining_bytes=>nil, :lost_data=>false, :start=>1409837842, :end=>nil}, {:id=>"2749d05d2a14981cd9ff276a02f7d6fd", :output_type=>"s3", :name=>"Pizza spaghetti Boston", :created_at=>1409834676, :user_id=>37691, :hash=>"1395c597440a1bdcb7ec49dde991a430", :hash_type=>"stream", :output_params=>{:format=>"json_meta", :delivery_frequency=>0, :bucket=>"datasift_output", :file_prefix=>"datasift", :acl=>"private", :directory=>"data"}, :status=>"active", :last_request=>nil, :last_success=>1409897802, :remaining_bytes=>nil, :lost_data=>false, :start=>1409834676, :end=>nil}, {:id=>"d6e8f8208db5548fbd3e5f3e2009e18e", :output_type=>"s3", :name=>"Pizza spaghetti San Jose", :created_at=>1409812483, :user_id=>37691, :hash=>"beb37c21e3a5771d7ad93076c6962cf9", :hash_type=>"stream", :output_params=>{:format=>"json_meta", :delivery_frequency=>0, :bucket=>"datasift_output", :file_prefix=>"datasift", :acl=>"private", :directory=>"data"}, :status=>"active", :last_request=>nil, :last_success=>1409898847, :remaining_bytes=>nil, :lost_data=>false, :start=>1409812483, :end=>nil}, {:id=>"b29f147023bbdcb04a6017a9bff54b53", :output_type=>"s3", :name=>"Pizza spaghetti chicago", :created_at=>1409812467, :user_id=>37691, :hash=>"7ba3d0b3147601e85dfdc15fe4644b15", :hash_type=>"stream", :output_params=>{:format=>"json_meta", :delivery_frequency=>0, :bucket=>"datasift_output", :file_prefix=>"datasift", :acl=>"private", :directory=>"data"}, :status=>"active", :last_request=>nil, :last_success=>1409891881, :remaining_bytes=>nil, :lost_data=>false, :start=>1409812467, :end=>nil}, {:id=>"2c1532f823c1f4115dc1a08943a424e5", :output_type=>"s3", :name=>"Pizz and spaghetti in new york", :created_at=>1409738578, :user_id=>37691, :hash=>"8909a77e95de7d0cfcedfd6ddf12c47a", :hash_type=>"stream", :output_params=>{:format=>"json", :delivery_frequency=>0, :bucket=>"datasift_output", :file_prefix=>"datasift", :acl=>"authenticated-read"}, :status=>"active", :last_request=>nil, :last_success=>1409899366, :remaining_bytes=>nil, :lost_data=>false, :start=>1409738578, :end=>nil}], :count=>6}, :datasift=>{:x_ratelimit_limit=>"10000", :x_ratelimit_remaining=>"9998", :x_ratelimit_cost=>"1"}, :http=>{:status=>200, :headers=>{:server=>"nginx", :date=>"Fri, 05 Sep 2014 06:47:26 GMT", :content_type=>"application/json", :transfer_encoding=>"chunked", :connection=>"close", :x_api_version=>"1", :p3p=>"CP=\"CAO PSA\"", :x_ratelimit_limit=>"10000", :x_ratelimit_remaining=>"9998", :x_ratelimit_cost=>"1", :x_served_by=>"ded2587"}}}


    @datasift_subscription = DatasiftSubscription.new

  end

  def billing
  end

  def logs
    datasift =  DatasiftCalls.new
    @logs = datasift.get_logs
  end

  def create_subscription

  end

end
