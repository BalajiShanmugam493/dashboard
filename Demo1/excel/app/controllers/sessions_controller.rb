class SessionsController < ApplicationController
  before_action :authenticate_user, :only => [:home, :profile, :setting]
#before_action :save_login_state, :only => [:login, :login_attempt]
  def login
    #Login Form
    render layout: 'layout1'
  end
  def login_attempt
  authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
  if authorized_user
    session[:user_id] = authorized_user.id
    flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
    redirect_to :controller => 'userrolemaps', :action => 'welcome' 
  else
    flash[:notice] = "Invalid Username or Password"
    flash[:color]= "invalid"
    redirect_to :controller => 'sessions', :action => 'login'	
  end
  #render layout: 'layout1'
end
	def logout
  	session[:user_id] = nil
  	redirect_to :action => 'login'
	end
end