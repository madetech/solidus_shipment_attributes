describe 'Order shipment description', type: :request do
  let!(:user) { create(:admin_user) }

  let(:shipment) do
    create(:shipment, shipping_method: create(:shipping_method, :with_description))
  end

  before do
    shipment.order.user = user
    user.generate_spree_api_key!
  end

  it 'displays the shipping method description' do
    get("/api/orders/#{shipment.order.number}", token: user.spree_api_key)

    shipping_methods = JSON.parse(response.body)['shipments'][0]['shipping_methods']

    expect(shipping_methods.map(&:keys).flatten.uniq).to include('description')
    expect(shipping_methods.map{ |s| s['description'] }.flatten.uniq).to include('Super Made Tech shipping method')
  end
end
