class User::AdminsController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to user_admins_path, notice: "Admin user created successfully."
    else
      render :new
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password)
  end
end
