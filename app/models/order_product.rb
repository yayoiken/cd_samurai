class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :genre
  attachment :product_image

  enum ship_status: {reception: 0, preparing: 1, shipped: 2}

end
