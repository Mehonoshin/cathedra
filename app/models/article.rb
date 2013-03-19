class Article < ActiveRecord::Base
  CATEGORIES = ["students", "tutors"]

  attr_accessible :body, :title, :category

  validates :title, presence: true
  validates :body, presence: true
end
