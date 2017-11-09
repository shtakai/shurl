class UrlsController < ApplicationController
  def create
    logger.debug params[:url]
    @url = get_url(params)
    logger.debug "url: #{@url}"
    if @url.valid?
      redirect_to @url, notice: 'GENERATED'
    else
      flash.now[:alert] = 'INVALID URL'
      redirect_to root_path, alert: 'INVALID URL'
    end
  end

  def show
    @url = Url.find_by(id: params[:id])
    redirect_to 'error' unless @url.present?
  end

  def redirect
    @url = Url.find_by(short_url: params[:short_url])
    redirect_to root_path, alert: 'INVALID URL' unless @url.present?
    redirect_to @url.url.to_s
  end

  private

  def get_url(params)
    Url.find_by(url: params[:url][:url]) || Url.create(url: params[:url][:url])
  end

  def url_params
    params.require(:url).permit(:url)
  end
end
