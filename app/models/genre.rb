class Genre < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :genre, presence: true
end
