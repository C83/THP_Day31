class UsersController < ApplicationController
  def show
  	if user_signed_in?
  		if current_user.id == params[:id].to_i
  			@this_user = User.find_by_id(current_user.id)
  		else
  			flash[:danger] = 'You can see only your profile. You are redirected to homepage'
			redirect_to root_path 
  		end
  	else 
  		redirect_to new_user_session_path
  	end
  end
end
