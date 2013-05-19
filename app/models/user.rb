# coding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, ,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :is_admin, :fio, :department_id, :group, :course, :user_role
  attr_accessor :user_role
  # attr_accessible :title, :body
  #
  belongs_to :department
  has_one :student, dependent: :destroy

  validates :fio, presence: true
  validate :presence_of_department_for_student, on: :create

  after_create :set_pending_tutor_if_needed
  after_create :create_according_student

  state_machine :state, :initial => :guest do
    event :admin do
      transition any => :admin
    end

    event :user do
      transition any => :user
    end

    event :admin do
      transition any => :admin
    end

    event :tutor do
      transition any => :tutor
    end

    event :pending_tutor do
      transition :guest => :pending_tutor
    end
  end

  def user_role
    @user_role || "user"
  end

  private

  def create_according_student
    Student.create!(
      user_id: id,
      department_id: department_id,
      course: course,
      group_num: group,
      name: fio
    ) if user_role == "user"
  end

  def set_pending_tutor_if_needed
    pending_tutor! if user_role == "tutor"
  end

  def presence_of_department_for_student
    if user_role == "user"
      errors.add(:department_id, "Не может быть пустым") if department_id.nil?
      errors.add(:course, "Не может быть пустым") if course.nil?
      errors.add(:group, "Не может быть пустым") if group.nil?
    end
  end

end
