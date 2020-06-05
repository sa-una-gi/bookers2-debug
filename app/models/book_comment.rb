class BookComment < ApplicationRecord
  belongs_to :user,optional: true
  belongs_to :book
  validates :comment ,presence: true
end
