class ProductsController < ApplicationController

    def index
        @products = Product.all
      if user_signed_in?
        @histories = ViewHistory.where(user_id: current_user.id).order(created_at: "DESC").limit(5)
      end
    end

    def show
    @product = Product.find(params[:id])
    if user_signed_in?
      @cart = Cart.new
      history = current_user.view_histories.new(product_id: @product.id)
      if ViewHistory.find_by(user_id: current_user.id,product_id: @product.id).present?
      old_history = ViewHistory.find_by(user_id: current_user.id,product_id: @product.id)
      old_history.delete
      end
      history.save
    end
    end

end

