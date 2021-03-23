require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { FactoryBot.create(:customer) }

  it 'is valid factory' do
    expect(customer).to be_valid
  end
end
