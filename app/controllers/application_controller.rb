#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'pub'

def logged?
    redirect_to "/autenticar" if session[:id].nil?
  end

end
