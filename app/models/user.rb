class User < ActiveRecord::Base
  validates_presence_of :email, :full_name, :password
  validates_uniqueness_of :email
  validates :password, length: { minimum: 8}

  has_many :reviews
  has_many :queue_items, -> { order(:position)}

  has_many :following_relationships, class_name: "Relationship", foreign_key: "follower_id"
  has_many :leaders, through: :following_relationships

  has_many :follower_relationships, class_name: "Relationship", foreign_key: "leader_id"
  has_many :followers, through: :follower_relationships
  
  has_secure_password

  def queued_item?(video)
    !!queue_items.find_by(video: video)
  end
end
