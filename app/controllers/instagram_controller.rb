class InstagramController < ApplicationController

  CALLBACK_URL = "http://localhost:3000/instagram/callback"

  def index
     
  end

  def connect
    redirect_to Instagram.authorize_url(redirect_uri: CALLBACK_URL)
  end

  def callback
    request.session[:init] = true
    response = Instagram.get_access_token(params[:code], redirect_uri: CALLBACK_URL)
    session[:access_token] = response.access_token
  end

  def user_recent_media
    client = Instagram.client(:access_token => session[:access_token])
    user = client.user

    @instagramPics = client.user_recent_media
  end

  def logout_instagram
    puts "loggin user out "
    session[:access_token] = nil
  end

end
