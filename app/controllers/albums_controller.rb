class AlbumsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: AlbumDatatable.new(view_context) }
    end
  end

  def home; end

  def new
    @album = Album.new
  end

  def create
    if Album.create(album_params)
      path = albums_path
    else
      path = root_path
    end
    redirect_to path
  end

  def edit
    # Edit that album data.
    @album = Album.find(params[:id])
    @method = 'PUT'
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      flash[:success] = 'Album updated successfully.'
      path = albums_path
    else
      flash[:error] = 'Problem updating album.'
      path = root_path
    end
    redirect_to path
  end

  def upload
    result = FileUploadService.new(upload_params).create
    if result[:status] == 'failed'
      flash[:error] = result[:message]
      path = root_path
    else
      path = albums_path
      flash[:success] = result[:message]
    end
    redirect_to path
  end

  def destroy
    # Delete particular record from the view
    album = Album.find(params[:id])
    album.destroy
    render json: album
  end

  private

  def album_params
    params.require(:album).permit(:artist, :album, :title, :year, :record_condition)
  end

  def upload_params
    params.permit(:file)
  end
end
