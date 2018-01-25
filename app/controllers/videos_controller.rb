class VideosController < ApplicationController
  before_action do
    require_login
  end

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def search
    @videos = Video.search_by_title(params[:search_term])
    render :index
  end
end