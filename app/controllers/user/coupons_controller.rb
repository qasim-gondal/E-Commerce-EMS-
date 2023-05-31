class User::CouponsController < ApplicationController
  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      redirect_to user_coupons_path, notice: "Coupon created successfully."
    else
      render :new
    end
  end

  def index
    @coupons = Coupon.all
  end

  # Other actions: show, edit, update, destroy

  private

  def coupon_params
    params.require(:coupon).permit(:name, :discount_value, product_ids: [])
  end
end
