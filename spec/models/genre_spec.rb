require 'rails_helper'

RSpec.describe Genre, type: :model do
  let(:genre) { FactoryBot.create(:genre) }

  it 'has a valid factory' do
    expect(genre).to be_valid
  end

  it 'is invalid without a genre' do
    genre.genre = ""
    expect(genre).to be_invalid
  end
end
