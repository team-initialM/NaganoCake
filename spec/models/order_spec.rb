require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:customer) { FactoryBot.create(:customer) }
  let(:order) { FactoryBot.create(:order, customer_id: customer.id) }

  it 'has a valid factory' do
    expect(order).to be_valid
  end

  it 'is invalid when customer_id is nil' do
    order.customer_id = nil
    expect(order).to be_invalid
  end

  it 'is invalid when order_status is nil' do
    order.order_status = nil
    expect(order).to be_invalid
  end

  it 'is invalid when total_price is nil' do
    order.total_price = nil
    expect(order).to be_invalid
  end

  it 'is invalid when total_price is 0' do
    order.total_price = 0
    expect(order).to be_invalid
  end

  it 'is invalid when total_price is smaller than 0' do
    order.total_price = -1
    expect(order).to be_invalid
  end

  it 'is invalid without a postcode' do
    order.postcode = ""
    expect(order).to be_invalid
  end

  it 'is invalid without an address' do
    order.address = ""
    expect(order).to be_invalid
  end

  it 'is invalid without an address_name' do
    order.address_name = ""
    expect(order).to be_invalid
  end

  it 'is invalid when payment_selection is nil' do
    order.payment_selection = nil
    expect(order).to be_invalid
  end

  it 'is invalid when postage is nil' do
    order.postage = nil
    expect(order).to be_invalid
  end

  it 'is invalid when postage is smaller than 0' do
    order.postage = -1
    expect(order).to be_invalid
  end

  it 'is valid when postage is 0' do
    order.postage = 0
    expect(order).to be_valid
  end
end
