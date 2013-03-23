class Material < ActiveRecord::Base
  CATEGORIES = ["lection_topics", "practice_topics", "exam_topics", "stud_society", "recommended"]
  FACULTIES = ["a", "b", "c"]
  attr_accessible :category, :department, :file, :title

  mount_uploader :file, AttachmentUploader

  validates :title, presence: true
end
