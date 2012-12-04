class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in

  def current_user
  	User.find(2)
  end

  def logged_in
  	true
  end
end
