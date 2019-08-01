class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order.order_products.each do |op|
      @genre = Genre.find(op.genre_id)
    end
    @ship_status = OrderProduct.where(ship_status: :ship_status)

  end

  def update
  	@order = Order.find(params[:id])
  	@order.order_products.each do |op|
  	  op.update(order_product_params)
  	end
  	redirect_to admins_orders_path

  end

  def order_product_params
	params.require(:order_product).permit(:ship_status)
  end

end
