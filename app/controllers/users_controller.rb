class UsersController < ApplicationController
  def index
  end
  def create
    # fail
    user = User.new(user_params)
    # Add in errors here for validations
    user.save
    redirect_to('/') # redirect to dashboard once page is up
  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @edit_user = User.find(params[:id])

  end

  def update
    update_user = User.find(params[:id])
    update_user.update(first_name: params[:first_name], last_name: params[:last_name], username: params[:user_name],
                        email: params[:email])
    update_user.save
    redirect_to "/users/#{update_user.id}"
  end
  private
  def user_params
    params.require(:user).permit(:acct_num, :first_name, :last_name, :username,
     :email, :password, :password_confirmation)
  end
end
