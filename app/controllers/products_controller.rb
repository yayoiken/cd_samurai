class ProductsController < ApplicationController

    def index
        @products = Product.all
      if user_signed_in?
        @histories = ViewHistory.where(user_id: current_user.id).order(created_at: "DESC").limit(5)
      end
    end

    def show
    if user_signed_in?
      @product = Product.find(params[:id])
      @cart = Cart.new
      history = current_user.view_histories.new(product_id: @product.id)
      history.save
    else
      @product = Product.find(params[:id])
    end
    end

end

