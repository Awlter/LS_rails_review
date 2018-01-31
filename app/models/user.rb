class User < ActiveRecord::Base
  validates_presence_of :email, :full_name, :password
  validates_uniqueness_of :email
  validates :password, length: { minimum: 8}

  has_many :reviews
  has_many :queue_items, -> { order(:position)}
  
  has_secure_password

  def queued_item?(video)
    !!queue_items.find_by(video: video)
  end
end
