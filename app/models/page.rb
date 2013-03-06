class Page < ActiveRecord::Base
  attr_accessible :body, :permalink, :title

  validates :title, presence: true
  validates :body, presence: true
  validates :permalink, presence: true, uniqueness: true
end
