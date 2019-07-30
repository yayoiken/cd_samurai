class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, if: :devise_controller?

  before_action :store_current_location, unless: :devise_controller?

  protect_from_forgery with: :null_session

  before_action :set_search

  def after_sign_in_path_for(resource)
   stored_location_for(resource) || root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
# ransack
  def set_search
    @search = Product.ransack(params[:q]) #ransackメソッド推奨
    @search_products = @search.result
  end

 private
   def store_current_location
     store_location_for(:user, request.url)
   end


protected
 def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, :gender])
 end
end
