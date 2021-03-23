require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:genre) { FactoryBot.create(:genre) }
  let(:product) { FactoryBot.create(:product, genre_id: genre.id) }

  it 'has a valid factory' do
    expect(product).to be_valid
  end

  it 'is invalid when genre_id is nil' do
    product.genre_id = nil
    expect(product).to be_invalid
  end

  it 'is invalid without a name' do
    product.name = ""
    expect(product).to be_invalid
  end

  it 'is invalid without a description' do
    product.description = ""
    expect(product).to be_invalid
  end

  it 'is invalid when price is nil' do
    product.price = nil
    expect(product).to be_invalid
  end

  it 'is invalid when price is 0' do
    product.price = 0
    expect(product).to be_invalid
  end

  it 'is invalid when price is smaller than 0' do
    product.price = -1
    expect(product).to be_invalid
  end

  it 'is invalid when is_valid is nil' do
    product.is_valid = nil
    expect(product).to be_invalid
  end
end
