class User::UsersController < ApplicationController
  def index
    if params[:search]
      @users = User.where("email LIKE ?", "%#{params[:search]}%")
    else
      @users = User.all
    end
  end

  def export
    @users = User.all
    respond_to do |format|
      format.csv { send_data export_csv, filename: "users.csv" }
    end
  end

  private

  def export_csv
    CSV.generate(headers: true) do |csv|
      csv << User.attribute_names
      @users.each do |user|
        csv << user.attributes.values
      end
    end
  end
end
