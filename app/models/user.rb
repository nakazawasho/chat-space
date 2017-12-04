class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, omniauth_providers: [:facebook]

  #validation
  validates :name, :email, presence: true
  validates_uniqueness_of :name, :email
  validates :password, presence: false, on: :facebook_login

  #association
  has_many :members
  has_many :groups, through: :members
  has_many :messages

  #scope
  scope :search_with_keyword, -> (keyword){ where('name LIKE(?)', "%#{keyword}%") }
  scope :not_search_with_id, -> (id){ where.not(id: id) }

  def self.from_omniauth(auth)
      # emailの提供は必須とする
      user = User.where('email = ?', auth.info.email).first
    if user.blank?
      user = User.new
    end
    user.uid   = auth.uid
    user.name  = auth.info.name
    user.email = auth.info.email
    user.icon  = auth.info.image
    user.oauth_token      = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user
  end
end
a
