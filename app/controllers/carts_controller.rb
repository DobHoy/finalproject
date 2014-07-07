class CartsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  

  def listorder
    # @current_order = Order.find(params[:id])
    # @current_order.total = sum(listitems.quanity x price)

    



  end

  def test


  end

  def create


    # Grab the infomation from the form




        add = params[:city]
    puts "the address is #{add}"
    puts "current customer is #{current_customer.email}"
    @orderThatWasCompleted = current_customer.current_order
    @orderThatWasCompleted.address = add
   current_customer.current_order.total = 3455 #CHANGE THIS

      puts "the stripe token is!!!!"
      puts params[:stripeToken]

      #create stripe customer id
      stripe_customer = Stripe::Customer.create(
        :email => current_customer.email,
        :card  => params[:stripeToken]
      )

      #store the stripe customer id
      current_customer.stripe_customer_id = stripe_customer.id

      puts current_customer.current_order.total
      current_customer.current_order.total = 3455

      # raise
      if current_customer.current_order.total == nil
        puts "the total is nil?"
      end

      stripe_charge = Stripe::Charge.create(
        :customer    => stripe_customer.id,
        :amount      => 2000,
        :description => 'Cache money customer',
        :currency    => 'gbp'
      )

      #store the stripe order id for fututre retrival
      current_customer.current_order.stripe_charge_id = stripe_charge.id

      puts "current customer's stripe id is #{current_customer.current_order.stripe_charge_id}"

      puts "charge and custsmoer stripe ids"
      puts stripe_charge.id
      puts stripe_customer.id

      puts "#{current_customer.email} so we all good"
      # current_customer.current_order.total.iscomplete = true #as order is complete

      #send the prawn pdf here
      #then save it to 
      # current_customer.current_order.invoiceurl = prawn_url
      #then send the url 




    render :test

  end


end

