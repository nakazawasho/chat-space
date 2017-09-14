class Group < ApplicationRecord
  #association
  has_many :members
  has_many :users, through: :members
  has_many :messages

  #validation
  validates :name, presence: true
end
