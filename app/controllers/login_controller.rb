#encoding: utf-8
class LoginController < ApplicationController

  def login
	if request.post?
	    email= params[:email]
      password = params[:password]

    if email.blank? && password.blank?
      flash[:notice] = "Informe email e senha"
      return
    end

    if email.blank?
      flash[:notice] = "Informe o email"
      return
    end

	if password.blank?
	  flash[:notice] = "Informe a senha"
	  return
	end

    user = Person.auth(email,password)
	  if !user
	  flash[:notice] = "Falha no login"
	  return
	end

    flash[:notice] = "Bem-vindo!"
    session[:id] = user.id
    session[:email] = user.email
    redirect_to "/vacants/avaliable/"
    end
  end
  def logout
  	session[:id] = nil
	session[:name] = nil
	redirect_to '/vacants'
  end

end