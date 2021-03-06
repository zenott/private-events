class ApplicationController < ActionController::Base
  helper_method :current_user
  
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end
end
