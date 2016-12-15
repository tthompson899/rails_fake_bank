class SessionsController < ApplicationController
  def create
    # validations - required username and password - throws error if you can't find it

    session = User.find_by(username: session_params[:username])
    if session
      redirect_to "/users/#{session.id}"
    else
      redirect_to :back
    end
  end

  def destroy
    reset_session
    redirect_to "/"
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
