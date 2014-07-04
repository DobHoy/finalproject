class InstagramController < ApplicationController

  CALLBACK_URL = "http://localhost:3000/instagram/callback"

  def index
      # //create user here?

      # check user table for your instagram id  
      # if yes, user has been here before
      #       does he have a current order?
      #         yes: prodcut page with current user and current order
      #         no: create order, then go to product page
      # if no, user has not been here before
      #     create user
      #       create curernt order
      #         then go to product page with both

      # what do you do when you just get to the index with the acess token?


  end

  def connect

    
    redirect_to Instagram.authorize_url(redirect_uri: CALLBACK_URL)
  end

  def callback
    request.session[:init] = true
    response = Instagram.get_access_token(params[:code], redirect_uri: CALLBACK_URL)
    session[:access_token] = response.access_token
    



 



      # check user table for your instagram id  
      # if yes, user has been here before
      #       does he have a current order?
      #         yes: prodcut page with current user and current order
      #         no: create order, then go to product page
      # if no, user has not been here before
      #     create user
      #       create curernt order
      #         then go to product page with both

      # what do you do when you just get to the index with the acess token?
      # should I store the order id in session?

    #       client = Instagram.client(:access_token => session[:access_token])

    #       mycustomer_id = client.user.id

    #       @customer = Customer.find_or_create_by(:id => mycustomer_id)

    #       @current_order = @customer.orders.last 



    #       #check if last order is complete or not            
    #       #create a order set it to incomplete
    #       if @current_order == nil || @current_order.iscomplete
    #         @current_order = Order.new(iscomplete: false)
    #       end






    # redirect_to "/products"
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
