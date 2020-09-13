class Author < ActiveRecord::Base
  # validates name isn't blank
  # email is unique
  # phone number is exactly 10 digits
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :phone_number, length: {is: 10}
end
