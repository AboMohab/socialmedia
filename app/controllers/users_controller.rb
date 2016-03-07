class UsersController < ApplicationController

	before_action :require_no_user ,only: [:new,:create]

	def new
		@user = User.new
	end 

	def create 
		@user=User.new(user_params)
		if @user.save
			session[:user_id]=@user.id 
			redirect_to '/'
		else 
			redirect_to '/signup'
		end
	end 

	def profile
		@user=current_user
	end 

	def edit
		@user=current_user
	end 

	def update 
		@user = current_user
		if @user.update_attributes(user_params)
			redirect_to '/profile'
		else 
			redirect_to '/edit'
		end 
	end 

	private 
	def user_params
		params.require(:user).permit(:first_name,:last_name,:email,:password)
	end 

end
