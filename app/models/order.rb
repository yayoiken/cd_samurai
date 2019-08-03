class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy
  enum payment_method: {card: 0, bank: 1, pay: 2}

  def sum_price(user)
  	carts = user.carts
  	sum = 0
  	carts.each do |cart|
  	price = cart.quantity*cart.product.price
    sum += price
    end
    return sum
  end

end
