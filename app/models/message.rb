class Message < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :group

  #validation
  validates_presence_of :content, :unless => :image?
  validates_presence_of :image, :unless => :content?


  mount_uploader :image, ImageUploader

  def created_time
    created_at.strftime('%Y/%m/%d %H:%M')
  end
end
