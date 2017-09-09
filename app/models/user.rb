class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #validation
  validates :name, :email, presence: true
  validates_uniqueness_of :name, :email

  #association
  has_many :members
  has_many :groups, through: :members
  has_many :messages
end
