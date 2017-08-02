class InstagramController < ApplicationController
  layout 'login'
  before_action :authenticate_user!
  before_action :set_callback_url

  def index
  end

  def create
    redirect_to Instagram.authorize_url(:redirect_uri => @callback_url, scope: 'public_content')
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => @callback_url)
    if response && response.access_token
      InstagramToken.find_or_create_by!(token: response.access_token)
      redirect_to instagram_index_url, {notice: 'Access Token has been created!'}
    else
      redirect_to instagram_index_url, {error: 'Access Token can not create!'}
    end
  end

  private

    def set_callback_url
      @callback_url = callback_instagram_index_url
    end

end
