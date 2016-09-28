describe 'Order shipment description', type: :request do
  let!(:user) { create(:admin_user) }

  let(:shipment) do
    create(:shipment, shipping_method: create(:shipping_method, :with_description))
  end

  before do
    shipment.order.user = user
    user.generate_spree_api_key!

    get("/api/orders/#{shipment.order.number}", token: user.spree_api_key)
  end

  it 'displays the shipping method description' do
    shipping_methods = order_shipment['shipping_methods']

    expect(shipping_methods.map(&:keys).flatten.uniq).to include('description')
    expect(shipping_methods.map{ |s| s['description'] }.flatten.uniq).to include('Super Made Tech shipping method')
  end

  it 'displays the shipping rate description' do
    shipping_rates = order_shipment['shipping_rates']

    expect(shipping_rates.map(&:keys).flatten.uniq).to include('description')
    expect(shipping_rates.map{ |s| s['description'] }.flatten.uniq).to include('Super Made Tech shipping method')
  end

  def order_shipment
    parsed_response['shipments'].first
  end

  def parsed_response
    JSON.parse(response.body)
  end
end
