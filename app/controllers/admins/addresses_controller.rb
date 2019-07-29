class Admins::AddressesController < ApplicationController

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to admins_user_path(@address.user.id)
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to admins_user_path(@address.user.id)
  end

  private
  def address_params
    params.require(:address).permit(:user_id,:tel_number,
      :postal_code,:address,:to_name,:to_name_kana)

  end
end
