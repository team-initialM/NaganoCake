require 'rails_helper'

RSpec.describe CartProduct, type: :model do
  let(:customer) { FactoryBot.create(:customer) }
  let(:genre) { FactoryBot.create(:genre) }
  let(:product) { FactoryBot.create(:product, genre_id: genre.id) }
  let(:cart_product) { FactoryBot.create(:cart_product, customer_id: customer.id, product_id: product.id) }

  it 'has a valid factory' do
    expect(cart_product).to be_valid
  end

  it 'is invalid when product_id is nil' do
    cart_product.product_id = nil
    expect(cart_product).to be_invalid
  end

  it 'is invalid when customer_id is nil' do
    cart_product.customer_id = nil
    expect(cart_product).to be_invalid
  end

  it 'is invalid when quantity is nil' do
    cart_product.quantity = nil
    expect(cart_product).to be_invalid
  end

  it 'is invalid when quantity is 0' do
    cart_product.quantity = 0
    expect(cart_product).to be_invalid
  end

  it 'is invalid when quantity is smaller than 0' do
    cart_product.quantity = -1
    expect(cart_product).to be_invalid
  end
end
