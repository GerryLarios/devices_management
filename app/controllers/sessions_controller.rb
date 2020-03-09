class SessionsController < ApplicationController
  def index
  end

  def create
    puts params
    user = User.find_by_email(user_params[:email])
    user && user.authenticate(user_params[:password]) ? login(user.id) : show_errors
  end
  
  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def login id
    session[:user_id] = id 
    redirect_to '/dashboard'
  end

  def show_errors
    flash[:alert] = ['Invalid credentials']
    redirect_to '/sessions'
  end
end
