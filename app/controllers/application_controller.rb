class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "application"

  protected

  def authenticate_user! *args
    if user_signed_in?
      super
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
