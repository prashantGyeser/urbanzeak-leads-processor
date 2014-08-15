require 'json'

class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
  def create

    puts "Okay it is getting called"
    puts params.inspect

    user = User.create(email: params[:email])
    oauth_token = OauthToken.create(user_id: user.id, oauth_token: params[:oauth_token], oauth_secret: params[:oauth_secret], provider: "twitter")
    UserCity.create(city_id: 1, user_id: user.id)
    UserCategory.create(category_id: 1, user_id: user.id)

    render json: user


  end
end