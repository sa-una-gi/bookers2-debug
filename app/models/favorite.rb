class Favorite < ApplicationRecord
  validates :user_id, presence: true, uniqueness: {scope: :book_id}
  validates :book_id, presence: true
  belongs_to :book
  belongs_to :user,optional: true
end
