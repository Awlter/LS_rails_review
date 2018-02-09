class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, -> { order(created_at: :desc) }
  has_many :queue_items

  validates_presence_of :title, :description

  def self.search_by_title(title)
    return [] if title.blank?
    where("title LIKE ?", "%#{title}%").order(created_at: :asc)
  end
end
