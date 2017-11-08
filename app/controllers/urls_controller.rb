class UrlsController < ApplicationController

  def create
    logger.debug params[:url]
    logger.debug get_url(params)
  end

  private

  def get_url(params)
    Url.find_by(url: params[:url][:url]) || Url.create(url: params[:url][:url])
  end

  def url_params
    params.require(:url).permit(:url)
  end


end

