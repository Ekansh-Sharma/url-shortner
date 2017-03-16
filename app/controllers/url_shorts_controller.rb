class UrlShortsController < ApplicationController
  before_action :set_url_short, only: [:show, :edit, :update, :destroy]

  def index
    @url_shorts = UrlShort.all
  end

  def show
  end

  def edit
  end

  def new
    @url_short = UrlShort.new
  end

  def redirected_url
    @url_short = UrlShort.find_by_short_token(params[:short_url])
    respond_to do |format|
      if @url_short
        format.html { redirect_to @url_short.get_original_url }
      else
        format.html { redirect_to url_shorts_path }
      end
    end
  end

  def create
    @url_short = UrlShort.new(url_short_params)

    respond_to do |format|
      if @url_short.save
        format.html { redirect_to @url_short, notice: 'Url short was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @url_short.update(url_short_params)
        format.html { redirect_to @url_short, notice: 'Url short was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @url_short.destroy
    respond_to do |format|
      format.html { redirect_to url_shorts_url, notice: 'Url short was successfully destroyed.' }
    end
  end

  private
    def set_url_short
      @url_short = UrlShort.find(params[:id])
    end

    def url_short_params
      params.require(:url_short).permit(:original_url)
    end
end
