class OrderProductsController < ApplicationController

  private
  def order_product_params
  	params.require(:order_product).permit(:order_id,:genre_id,:artist_name,:cd_title,
                  :label_name,:product_image,:price,:ship_status)
  end
end