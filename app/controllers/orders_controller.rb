class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
  end

  def show
    @order = Order.find(params[:id])
    @order.order_products.each do |op|
      @genre = Genre.find(op.genre_id)
    end
  end

  def create
   @order = Order.new(order_params)
   if params[:back].present?
     render :new
     return
   end
   @order.user_id = current_user.id
   @order.save
     carts = current_user.carts
     carts.each do |cart|
      order_product = OrderProduct.new
      order_product.order_id = @order.id
      order_product.genre_id = cart.product.genre_id
      order_product.artist_name = cart.product.artist_name
      order_product.cd_title = cart.product.cd_title
      order_product.label_name = cart.product.label_name
      order_product.product_image_id = cart.product.product_image_id
      order_product.price = cart.product.price
      order_product.save
      @product = cart.product
      @product.stock = @product.stock - cart.quantity
      if @product.stock <= 0
           @product.buy_capable = false
      end
      @product.save
    end
    carts.delete_all
    redirect_to ordered_users_path
  end

private

  def order_params
  params.require(:order).permit(:payment_method,:to_address, :user_id,)
  end
end
