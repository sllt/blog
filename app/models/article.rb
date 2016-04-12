class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true

  default_scope { order("created_at DESC")}
  
  has_and_belongs_to_many :tags
end
