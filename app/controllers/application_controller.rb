class ApplicationController < ActionController::Base
  protect_from_forgery
  def logged?
    redirect_to "/login/login" if session[:id].nil?
  end
end
