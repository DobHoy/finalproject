class OmniauthCallbacksController < Devise::OmniauthCallbacksController

      def instagram
        handle_callback "instagram"
      end

      def google_oauth2
        handle_callback "google"
      end

      def github
        handle_callback "github"
      end

      def handle_callback(kind)
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        @customer = Customer.find_for_oauth(kind, request.env["omniauth.auth"], current_customer)
        #@customer.set_default_role
        session[:access_token] = request.env["omniauth.auth"]["credentials"]["token"]
        if @customer.persisted?
          flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => kind.titleize
          sign_in_and_redirect @customer, :event => :authentication
        else
          session["devise.#{kind}_data"] = request.env["omniauth.auth"]
          redirect_to new_customer_registration_url
        end
      end


end