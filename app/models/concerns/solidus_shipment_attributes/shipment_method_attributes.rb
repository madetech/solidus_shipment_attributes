module SolidusShipmentAttributes
  module ShipmentMethodAttributes
    extend ActiveSupport::Concern

    included do
      translates :description, fallbacks_for_empty_translations: true
    end
  end
end
