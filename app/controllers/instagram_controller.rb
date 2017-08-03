class InstagramController < ApplicationController
  layout 'login'
  before_action :authenticate_user!
  before_action :set_callback_url

  def index
    @api_services = instagram_apps
  end

  def create
    @info = ApiServiceInfo.find(instagram_params[:app_id])
    if @info
      session[:instagram_app_id] = @info.app_id
      session[:instagram_app_secret] = @info.app_secret
      Instagram.configure do |config|
        config.client_id = session[:instagram_app_id]
        config.client_secret = session[:instagram_app_secret]
      end
      redirect_to Instagram.authorize_url(:redirect_uri => @callback_url, scope: 'public_content')
    else
      redirect_to instagram_index_url, {error: 'Access Token can not create!'}
    end
  end

  def callback
    Instagram.configure do |config|
      config.client_id = session[:instagram_app_id]
      config.client_secret = session[:instagram_app_secret]
    end
    response = Instagram.get_access_token(params[:code], :redirect_uri => @callback_url)
    if response && response.access_token
      api_service = ApiServiceInfo.find_by(app_id: session[:instagram_app_id], app_secret: session[:instagram_app_secret])
      if api_service && api_service.update(app_token: response.access_token)
        redirect_to instagram_index_url, {notice: 'Access Token has been created!'}
      else
        redirect_to instagram_index_url, {error: 'Access Token can not save'}
      end
    else
      redirect_to instagram_index_url, {error: 'Access Token can not create!'}
    end
  end

  private

    def set_callback_url
      @callback_url = callback_instagram_index_url
    end

    def instagram_apps
      apis = ApiService.all
      api_services = []
      if apis.count > 0
        arr = apis.select{|item| item.status == true}
        arr.each do |item|
          api_services = api_services + item.api_service_infos.select{|info| info.active?}
        end
      end
      api_services
    end

    def instagram_params
      params.require(:instagram).permit(:app_id)
    end

end
