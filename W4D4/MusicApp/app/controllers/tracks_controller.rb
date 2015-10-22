class TracksController < ApplicationController
  before_action :require_current_user!
  def show
    @track = Track.find(params[:id])
    render :show

  end

  def destroy
    track = Track.find(params[:id])
    @album = track.album
    track.destroy
    redirect_to album_url(@album)
  end

  def new
    @album = Album.find(params[:album_id])
    @track = @album.tracks.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save!
      redirect_to album_track_url(@track.album_id, @track)
    else
      render json: track.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :title, :lyrics, :track_type)
  end
end
