class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shipping_addresses, dependent: :destroy
  has_many :orders, dependent: :nullify
  has_many :cart_products, dependent: :destroy

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :kana_firstname, presence: true
  validates :kana_lastname, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :is_valid, inclusion: { in: [true, false] }

  def self.looks(searches, words)
    @customers = Customer.where(['email LIKE ? OR firstname || lastname LIKE ?', "%#{words}%", "%#{words}%"])
  end
end
