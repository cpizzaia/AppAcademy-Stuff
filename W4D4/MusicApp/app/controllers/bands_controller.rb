class BandsController < ApplicationController
  before_action :require_current_user!
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    @albums = @band.albums
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def destroy
    Band.find(params[:id]).destroy
    redirect_to bands_url
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      render json: band.errors.full_messages, status: :unprocessable_entity
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save!
      redirect_to band_url(@band)
    else
      render json: band.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
