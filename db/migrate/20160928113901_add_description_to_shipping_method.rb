class AddDescriptionToShippingMethod < ActiveRecord::Migration
  def change
    change_table :spree_shipping_methods do |t|
      t.text :description
    end
  end
end
