require 'rails_helper'

RSpec.describe OrderProduct, type: :model do
  let(:customer) { FactoryBot.create(:customer) }
  let(:order) { FactoryBot.create(:order, customer_id: customer.id) }
  let(:genre) { FactoryBot.create(:genre) }
  let(:product) { FactoryBot.create(:product, genre_id: genre.id) }
  let(:order_product) { FactoryBot.create(:order_product, order_id: order.id, product_id: product.id) }

  it 'has a valid factory' do
    expect(order_product).to be_valid
  end

  it 'is invalid when quantity is nil' do
    order_product.quantity = nil
    expect(order_product).to be_invalid
  end

  it 'is invalid when quantity is 0' do
    order_product.quantity = 0
    expect(order_product).to be_invalid
  end

  it 'is invalid when quantity is smaller than 0' do
    order_product.quantity = -1
    expect(order_product).to be_invalid
  end

  it 'is invalid when product_price is nil' do
    order_product.product_price = nil
    expect(order_product).to be_invalid
  end

  it 'is invalid when product_price is 0' do
    order_product.product_price = 0
    expect(order_product).to be_invalid
  end

  it 'is invalid when product_price is smaller than 0' do
    order_product.product_price = -1
    expect(order_product).to be_invalid
  end

  it 'is invalid when production_status is nil' do
    order_product.production_status = nil
    expect(order_product).to be_invalid
  end
end
