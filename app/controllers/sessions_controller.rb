class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_login(params[:login])
    if user && user.password
      session[:user_id] = user.id
      respond_to do |format|
        format.html { redirect_to root_url, :notice => "Logged in!" }
        format.js {}
      end
    else
      respond_to do |format|
        format.html { redirect_to log_in_path, :notice => "Wrong login or password!" }
        format.js {}
      end
    end
  end
  
  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "Logged out!" }
      format.js {}
    end
  end
end
