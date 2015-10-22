class UsersController < ApplicationController
  def show # debug route
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      login!(@user)
      redirect_to bands_url
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, band_id: :id)
  end
end
