class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, if: :devise_controller?

  protect_from_forgery with: :exception

  helper_method :current_product

  before_action :set_search

  after_action  :store_location

  def store_location
    if (request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_up" &&
        request.fullpath !~ Regexp.new("\\A/users/password.*\\z") &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end


# ransack
  def set_search
    @search = Product.ransack(params[:q]) #ransackメソッド推奨
    @search_products = @search.result
  end


protected
 def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, :gender])
 end
end
