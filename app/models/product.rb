class Product < ApplicationRecord
  has_and_belongs_to_many :coupons
  belongs_to :cart
end
