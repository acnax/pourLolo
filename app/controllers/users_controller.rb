class UsersController < ApplicationController

  def show
		@user = User.find(params[:id])
	end


	def new
		@user = User.new
	end

	def create
		user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		@user = User.new(user_params) 
		@user.city = City.all.sample

  	if @user.save
  		log_in(@user)                                     
   		redirect_to gossips_path, success: "you're register"
		end
	end

end
