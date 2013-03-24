# coding: utf-8
class StudentsController < ApplicationController
  def index
    @students = []
    if params[:department].present?
      @department = Department.find(params[:department])
      @students = Student.where(department_id: params[:department], course: params[:course], group_num: params[:group])
    end
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to students_path(department: params[:student][:department_id], course: params[:student][:course], group: params[:student][:group_num]), notice: "Студент добавлен"
    else
      raise "Ой, какая-то беда"
    end
  end
end
