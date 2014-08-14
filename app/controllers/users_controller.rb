class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
  def create

    @ironmq = IronMQ::Client.new()

    # Get a queue (if it doesn't exist, it will be created when you first post a message)
    @queue = @ironmq.queue("new_user_queue")

    msg = @queue.get()

    message = msg.body

    message_array = message.split(',')

    user = User.create(email: message_array[0])
    oauth_token = OauthToken.create(user_id: user.id, oauth_token: message_array[1], oauth_secret: message_array[2], provider: "Twitter")
    UserCity.create(city_id: 1, user_id: user.id)
    UserCategory.create(category_id: 1, user_id: user.id)


    # Delete a message (you must delete a message when you're done with it or it will go back on the queue after a timeout)
    #msg.delete # or @queue.delete(msg.id)


  end
end