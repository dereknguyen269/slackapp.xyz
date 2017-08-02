class InstagramController < ApplicationController
  layout false

  CALLBACK_URL = 'http://localhost:3000/instagram/callback'

  def index
    render :index, layout: 'login'
  end

  def create
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:instagram_access_token] = response.access_token
    render json: {access_token: session[:instagram_access_token]}, status: 200
  end

end
