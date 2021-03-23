require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  let(:customer) { FactoryBot.create(:customer) }
  let(:shipping_address) { FactoryBot.create(:shipping_address, customer_id: customer.id) }

  it 'has a valid factory' do
    expect(shipping_address).to be_valid
  end

  it 'is invalid when customer_id is nil' do
    shipping_address.customer_id = nil
    expect(shipping_address).to be_invalid
  end

  it 'is invalid without a postcode' do
    shipping_address.postcode = ""
    expect(shipping_address).to be_invalid
  end

  it 'is invalid without an address' do
    shipping_address.address = ""
    expect(shipping_address).to be_invalid
  end

  it 'is invalid without an address_name' do
    shipping_address.address_name = ""
    expect(shipping_address).to be_invalid
  end
end
