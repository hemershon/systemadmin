class ProductQuantity < ApplicationRecord
  belongs_to :product
  belongs_to :sale, optional: true
  belongs_to :user
end
