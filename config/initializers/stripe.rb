Rails.configuration.stripe = {
  :publishable_key => "pk_test_wmqPoJHnps6KPgjyMOLf1dvA",
  :secret_key      => "sk_test_2E5RCKLxZhAePZdsYSoG8XGD"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
