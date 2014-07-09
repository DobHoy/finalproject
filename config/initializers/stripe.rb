Rails.configuration.stripe = {
  :publishable_key => ENV["STRIPE_PUB_KEY"],
  :secret_key      => ENV["STRIPE_SEC_KEY"]
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
STRIPE_PUBLIC_KEY = ENV["STRIPE_PUB_KEY"]
StripeEvent.subscribe 'charge.succeeded' do |event|
  # ReceiptMailer.send_receipt(event.data.object).deliver
  puts "hi is it me you're looking for"
end