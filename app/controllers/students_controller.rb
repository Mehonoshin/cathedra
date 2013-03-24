class StudentsController < ApplicationController
  def index
    @department = Department.find(params[:department])
    @students = Student.where(department_id: params[:department], course: params[:course], group_num: params[:group])
  end
end
