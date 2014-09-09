require 'json'

class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
  def create
    user = User.new(email: params[:email])
    if user.save
      render json: user
    else
      render :json => user, :status => :unprocessable_entity
    end

  end
end