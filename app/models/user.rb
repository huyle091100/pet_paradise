class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable, :validatable

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
