class ApplicationController < ActionController::Base
  protect_from_forgery

  # ovverrides cancan expectation to use current_user
  def current_ability
    @current_ability ||= Ability.new(current_customer)
  end
end
