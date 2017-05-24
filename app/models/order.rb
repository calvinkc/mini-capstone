class Order < ApplicationRecord
  
#  belongs_to :product, optional: true
  belongs_to :user

  has_many :carted_products
  has_many :products, through: :carted_products
end
