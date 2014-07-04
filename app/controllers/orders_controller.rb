class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  # GET /orders/1/edit?mugs
  def edit
    @order = Order.find(params[:id])
    @product = Product.find(params[:product_id])

    client = Instagram.client(:access_token => session[:access_token])
    @instagramPics = client.user_recent_media

    @instagramPics.each do |pic|
      unless @order.lineitems.detect { |li| li.instagram_id == pic.id && li.product == @product }
        @order.lineitems.build product: @product, quantity: 0, unit_price: @product.current_price, instagram_id: pic.id
      end
    end

    #get pictures and rendder edit page with my pictures 

  end

  def show_lineitems
    @lineitems = Lineitems.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])



    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    @order.update_attributes(params[:order])
    redirect_to products_path
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
