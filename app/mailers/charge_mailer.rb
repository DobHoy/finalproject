class ChargeMailer < ActionMailer::Base
  default from: "admin@katalyst.com"

  def charge_confirmation(email)
    puts "the email to send is " + email
    mail(:to => email, :subject => "Your card has been charged sucessfully")
  end

end
