class ChargeMailer < ActionMailer::Base
  default from: "admin@katalyst.com"

  def charge_confirmation(cus_id)
    puts "the cus to send is " + cus_id 
    email = Customer.where(stripe_customer_id: cus_id )[0].email
    mail(:to => email, :subject => "Your card has been charged sucessfully")
  end

end
