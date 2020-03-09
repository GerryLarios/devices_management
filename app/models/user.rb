class User < ApplicationRecord
  validates_presence_of [:name, :email]
  validates :email,  uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password
end
