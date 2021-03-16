class Genre < ApplicationRecord
  has_many :products, dependent: :nullify
end
