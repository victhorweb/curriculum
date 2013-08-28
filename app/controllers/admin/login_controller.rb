class Admin::LoginController < Admin::ApplicationController

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

    user = User.auth(email,password)
	  if !user
	  flash[:notice] = "Falha no login"
	  return
	end

    flash[:notice] = "Bem-vindo ao projeto BootCamp"
    session[:id] = user.id
    session[:email] = user.email
    redirect_to "/admin/people/"
    end
  end
  def logout
  	session[:id] = nil
	redirect_to :action=>:login
  end

end
