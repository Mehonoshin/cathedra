class Material < ActiveRecord::Base
  CATEGORIES = ["lection_topics", "practice_topics", "exam_topics", "stud_society", "recommended"]
  FACULTIES = ["a", "b", "c", "d"]
  attr_accessible :category, :department, :file, :title, :priority

  mount_uploader :file, AttachmentUploader

  validates :title, presence: true
  validates :priority, inclusion: 1..20
end
