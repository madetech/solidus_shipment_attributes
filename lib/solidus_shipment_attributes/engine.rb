module SolidusShipmentAttributes
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'solidus_shipment_attributes'

    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      if Spree::ShippingMethod.methods.include?(:with_translations)
        Spree::ShippingMethod.include(SolidusShipmentAttributes::ShipmentMethodAttributes)
      end

      Dir.glob(File.join(File.dirname(__FILE__), '../../app/overrides/*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
