class Admin::ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  def logged?
    redirect_to "/login/login" if session[:id].nil?
  end
end
