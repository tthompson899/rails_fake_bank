class SessionsController < ApplicationController
  def create

    session = User.find_by(username: session_params[:username])
    if session
      redirect_to "/users/#{session.id}"
    else
      redirect :back
    end
    # validations - required username and password - throws error if you can't find it
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
