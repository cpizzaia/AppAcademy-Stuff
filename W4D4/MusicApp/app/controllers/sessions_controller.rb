class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_email(params[:user][:email])

    if @user.nil?
      render json: "incorrect password or username"
    else
      login!(@user)
      redirect_to bands_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end


end
