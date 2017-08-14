class Group < ApplicationRecord
  #association
  has_many :members
  has_many :users, through: :members
end
