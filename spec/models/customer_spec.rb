require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { FactoryBot.create(:customer) }

  it 'has a valid factory' do
    expect(customer).to be_valid
  end

  it 'is invalid without a firstname' do
    customer.firstname = ""
    expect(customer).to be_invalid
  end

  it 'is invalid without a lastname' do
    customer.lastname = ""
    expect(customer).to be_invalid
  end

  it 'is invalid without a kana_firstname' do
    customer.kana_firstname = ""
    expect(customer).to be_invalid
  end

  it 'is invalid without a kana_lastname' do
    customer.kana_lastname = ""
    expect(customer).to be_invalid
  end

  it 'is invalid without an email' do
    customer.email = ""
    expect(customer).to be_invalid
  end

  it 'is invalid with a duplicate email' do
    other_customer = FactoryBot.build(:customer, email: customer.email)
    other_customer.valid?
    expect(other_customer.errors[:email]).to include("has already been taken")
  end

  it 'is invalid without a password' do
    customer.password = ""
    expect(customer).to be_invalid
  end

  it 'is invalid without a postcode' do
    customer.postcode = ""
    expect(customer).to be_invalid
  end

  it 'is invalid without an address' do
    customer.address = ""
    expect(customer).to be_invalid
  end

  it 'is invalid without a phone_number' do
    customer.phone_number = ""
    expect(customer).to be_invalid
  end

  it 'is true is_valid with a default customer' do
    expect(customer.is_valid).to eq true
  end

  it 'is invalid when is_valid is nil' do
    customer.is_valid = nil
    expect(customer).to be_invalid
  end
end
