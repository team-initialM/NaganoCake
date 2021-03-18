class Genre < ApplicationRecord
  has_many :products, dependent: :nullify

  # 長さのバリデーションは仮の数値！
  validates :genre, presence: true, length: { in: 1..20 }
end
