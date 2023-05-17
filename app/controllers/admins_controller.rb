class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      # Handle successful admin creation
      redirect_to root_path, notice: "Admin created successfully."
    else
      render :new
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password)
  end
end
