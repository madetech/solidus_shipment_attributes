module SolidusShipmentAttributes
  module ShippingRateAttributes
    extend ActiveSupport::Concern

    included do
      delegate :description, to: :shipping_method
    end
  end
end
