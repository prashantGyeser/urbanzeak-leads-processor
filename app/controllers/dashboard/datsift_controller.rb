require 'datasift_calls'

class Dashboard::DatsiftController < Dashboard::ApplicationController
  def subscriptions
  end

  def billing
  end

  def logs
    datasift =  DatasiftCalls.new
    @logs = datasift.get_logs
  end
end
