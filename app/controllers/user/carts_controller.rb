class User::CartsController < ApplicationController
  def add
    product = Product.find(params[:product_id])
    current_user.carts.create(product: product, quantity: 1)
    redirect_to user_cart_path
  end
end
