class AddAddressAndStripeChargeIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :address, :text
    add_column :orders, :stripe_charge_id, :string
  end
end
