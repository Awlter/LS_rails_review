class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews

  validates_presence_of :title, :description

  def self.search_by_title(title)
    return [] if title.blank?
    where("title LIKE ?", "%#{title}%").order(created_at: :asc)
  end
end
