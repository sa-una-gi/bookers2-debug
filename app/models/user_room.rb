class UserRoom < ApplicationRecord
  belongs_to :user,optional: true
  belongs_to :room
end
