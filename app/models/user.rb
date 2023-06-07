class User < ApplicationRecord
  after_create :send_confirmation_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :lockable, :confirmable

  private

  def send_confirmation_email
    UserMailer.confirmation_email(self).deliver_now
  end
end
