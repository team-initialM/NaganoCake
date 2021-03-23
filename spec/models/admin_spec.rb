require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { FactoryBot.create(:admin) }

  it 'has a valid factory' do
    expect(admin).to be_valid
  end

  it 'is invalid without an email' do
    admin.email = ""
    expect(admin).to be_invalid
  end

  it 'is invalid with a duplicate email' do
    other_admin = FactoryBot.build(:admin, email: admin.email)
    other_admin.valid?
    expect(other_admin.errors[:email]).to include("has already been taken")
  end

  it 'is invalid without a password' do
    admin.password = ""
    expect(admin).to be_invalid
  end
end
