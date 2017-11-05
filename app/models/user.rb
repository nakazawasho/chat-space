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

  #scope
  scope :search_with_keyword, -> (keyword){ where('name LIKE(?)', "%#{keyword}%") }
  scope :not_search_with_id, -> (id){ where.not(id: id) }
end
