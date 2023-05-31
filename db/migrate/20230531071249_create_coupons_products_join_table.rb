class CreateCouponsProductsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :coupons, :products do |t|
      t.index [:coupon_id, :product_id]
      t.index [:product_id, :coupon_id]
    end
  end
end
