class HomeController < ApplicationController
  include ShortUrlUtility

  def index
    @shorturls=ShortUrl.all
  end

  def new
    @shorturl = ShortUrl.new
  end

  def create
    @shorturl = ShortUrl.new(short_url_params)
    if @shorturl.save
      @shorturl.short_url=CalculateShortUrl(@shorturl.id)
      GetTitleTagJob.perform_later(@shorturl.full_url, @shorturl.id)
      @shorturl.save
      redirect_to "/home/index", notice: 'Shorturl was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @shorturl = ShortUrl.find(params[:id])
  end

  def update
    @shorturl = ShortUrl.find(params[:id])
    if @shorturl.update(short_url_params)
      redirect_to "/home/index", notice: 'Shorturl was successfully updated.'
    else
      render action: 'edit'
    end
  end
 
  def show
    @shorturl = ShortUrl.find(params[:id])
  end

  def destroy
    @shorturl = ShortUrl.find(params[:id])
    @shorturl.destroy
    redirect_to "/home/index", notice: 'Shorturl was successfully destroyed.'
  end

  private

  def short_url_params
    params.permit(:full_url, :short_url, :title)
  end


end
