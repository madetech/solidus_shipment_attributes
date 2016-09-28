class AddDescriptionToShippingMethod < ActiveRecord::Migration
  def change
    change_table :spree_shipping_methods do |t|
      t.string :description
    end
  end
end
