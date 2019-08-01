class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
  	@order.order_products.each do |op|
  	  @ship_status = op.ship_status
  	end
  	@ship_status.save
  	redirect_to admins_orders_path

  end

end
