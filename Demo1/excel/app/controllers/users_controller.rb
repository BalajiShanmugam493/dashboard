class UsersController < ApplicationController  
  #before_action :save_login_state, :only => [:new, :create]

  def new
    @user = User.new 
    render layout: 'layout1'
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    #render "new"
    
    redirect_to :controller => 'sessions', :action => 'login'
    #render layout: 'layout1'
  end
  def user_params
    params.require(:user).permit(:username, :mapRoleID, :password, :salt, :encrypted_password)
  end
end