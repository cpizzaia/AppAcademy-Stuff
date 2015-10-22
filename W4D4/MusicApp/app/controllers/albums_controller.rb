class AlbumsController < ApplicationController
  before_action :require_current_user!
  def show
    @album = Album.find(params[:id])
    @tracks = @album.tracks
    render :show
  end

  def new
    @band = Band.find(params[:band_id])
    @album = @band.albums.new
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      render json: album.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @band = @album.band
    @album.destroy
    redirect_to band_url(@band)
  end

  def create
    @album = Album.new(album_params)
    if @album.save!
      redirect_to album_url(@album)
    else
      render json: album.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def album_params
    params.require(:album).permit(:title, :recording_type, :band_id)
  end
end
