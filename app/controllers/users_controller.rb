class UsersController < ApplicationController
  def index
  end
  def create
    # fail
    user = User.new(user_params)
    # Add in errors here for validations
    user.save
  end
  def user_params
    params.require(:user).permit(:acct_num, :first_name, :last_name, :username,
     :email, :password, :password_confirmation)
  end
end
