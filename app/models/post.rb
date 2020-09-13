class Post < ActiveRecord::Base
  # validates title isn't blank
  # content is 100+ chars
  # category is either "Fiction" or "Non-Fiction"
  validates :title, presence: true
  validates :content, length: {minimum: 100}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
end
