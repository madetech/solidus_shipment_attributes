class AddDescriptionToShippingMethodTranslations < ActiveRecord::Migration
  def change
    return unless ActiveRecord::Base.connection.table_exists?(:spree_shipping_method_translations)

    reversible do |dir|
      dir.up do
        Spree::ShippingMethod.add_translation_fields! description: :string
      end

      dir.down do
        remove_column :spree_shipping_method_translations, :description
      end
    end
  end
end
