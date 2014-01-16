class UsersController < ApplicationController
before_action :is_admin, only: [:index, :edit, :update]
def index

     @users = User.all;
end
  
def show
    @user = User.find(params[:id])
end

def new
	@user= User.new 
end

def create
	@user= User.new(user_param)
	@user.role = "user"
	
	if @user.save
		redirect_to "/" 
	else 
		render 'new'
	end
end

def edit
	@user = User.find(params[:id])  
end

def update
	@user = User.find(params[:id])
	@user.login = params[:login]
	@user.role = params[:role]
	@user.save(validate: false)
	redirect_to "/users"
end

def destroy
	@user = User.find(params[:id])
		@user.destroy

		redirect_to "/users"
end

	private


	def user_param
		params.require(:user).permit(:login,:password,:role)
	end

	def is_admin
    	redirect_to root_url, notice: "У вас нет таких прав" unless current_user && current_user.role == "admin"
  	end
end
