Rails.configuration.stripe = {
  :publishable_key => ENV["STRIPE_PUB_KEY"],
  :secret_key      => ENV["STRIPE_SEC_KEY"]
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
STRIPE_PUBLIC_KEY = ENV["STRIPE_PUB_KEY"]
StripeEvent.subscribe 'charge.succeeded' do |event|
   

    # puts"the email is"
    # puts event.data.object.card.customer
    # email_ineed = Stripe::Customer.retrieve(event.data.object.card.customer)[:email]
    # # email_ineed = event.data.object.email
    # puts email_ineed

    #the above block takes too long and really I should have the stripe_customer_id stored in my 
    # table

     puts "hi is it me you're looking for"
    cus_id = event.data.object.card.customer
    puts "cus id is"
    puts cus_id 
  ChargeMailer.charge_confirmation(cus_id).deliver

end