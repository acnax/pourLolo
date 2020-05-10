class ApplicationController < ActionController::Base
	include SessionsHelper
	add_flash_types :danger, :info, :warning, :success

	private

	def authenticate_user
    unless current_user
    flash[:danger] = "Please log in."
    redirect_to new_session_path
  	end
  end

 
	
end
