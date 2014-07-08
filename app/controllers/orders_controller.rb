class OrdersController < ApplicationController
    skip_before_filter :verify_authenticity_token


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "You cannot access this page"
  end

  def pay 
    #FILL IN LATER
    # @order = ...
    @current_order = Order.find(params[:id])
  end

  def process_payment


      @current_order = Order.find(params[:id])

      add = params[:city] + params[:street]

      runningTotal = 0

      @current_order.lineitems.each do |lineitem|
        runningTotal += (lineitem.quantity*lineitem.unit_price)
       end

      @current_order.total = runningTotal

      puts "the stripe token is!!!!"
      puts params[:stripeToken]

      #create stripe customer id
      stripe_customer = Stripe::Customer.create(
        :email => current_customer.email,
        :card  => params[:stripeToken]
      )

      #store the stripe customer id
      current_customer.stripe_customer_id = stripe_customer.id
@current_order.total = 2000
      stripe_charge = Stripe::Charge.create(
        :customer    => stripe_customer.id,
        :amount      => @current_order.total,
        :description => 'Cache money customer',
        :currency    => 'gbp'
      )

      rescue Stripe::CardError => e
        flash[:error] = e.message
        # redirect_to pay_order_path(@current_order) 

      #store the stripe order id for fututre retrival
      @current_order.stripe_charge_id = stripe_charge.id

      puts "charge and custsmoer stripe ids"
      puts stripe_charge.id
      puts stripe_customer.id

      puts "#{current_customer.email} so we all good"

      @current_order.iscomplete = true

      @current_order.save!
      redirect_to(order_path(@current_order))


  end

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
    @current_order = Order.find(params[:id])
    # @order = current_customer.current_order
    authorize! :show, @current_order 

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
    # authorize! :edit, @current_order 

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
