class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :require_current_user

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    if session[:session_token]
      @current_user ||= User.find_by(session_token: session[:session_token])
    else
      nil
    end
  end

  def logout!
    session[:session_token] = nil
  end

  def require_current_user
    redirect_to new_session_url if current_user.nil?
  end

end
