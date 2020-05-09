class SessionsController < ApplicationController

 def new
 	@user = User.new
 end


	def create
		# cherche s'il existe un utilisateur en base avec l’e-mail
	  user = User.find_by(email: params[:session][:email])
                    
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if (user && user.authenticate(params[:session][:password]))
      session[:user_id] = user.id
      redirect_to gossips_path, success: "connected" # redirige où tu veux, avec un flash ou pas
                    
    else   
      render 'new', danger: 'Invalid email/password combination'
    end
  end

  def destroy
  	session.delete(:user_id)
  	redirect_to gossips_path, success: "disconnected"
  end


end
