class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product

   def cart_quantity
      cart_quantity = []
  	 if self.product.stock >= 10
  	    cart_quantity = [1,2,3,4,5,6,7,8,9,10]
  	 else
       self.product.stock.times do |i|
       	cart_quantity += [i+1]
       end
     end
   return cart_quantity
   end

  #cartの数量変更ロジック まだ使えない
  def cartadd(product_id, user)
  	product = self.find_by(product_id: product_id, user_id: user.id)
  	if product
  		product.quantity += 1
  	else
  		product = user.carts.build(product_id: product_id)
  	end
  	return product
  end

end
