class UsersController < ApplicationController
  def index
  end
 
  def new
    User.new
  end 

  def create
    user = User.new(user_params)
    user.save ? sign_up(user.id) : show_errors(user.errors)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def sign_up id
    session[:user_id] = id
    redirect_to '/sessions'
  end

  def show_errors errors
    flash[:alert] = errors.full_messages
    redirect_to '/' 
  end
end
