class Dashboard::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  layout "dashboard/application"

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

end
