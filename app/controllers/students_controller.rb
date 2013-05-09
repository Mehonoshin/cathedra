# coding: utf-8
class StudentsController < ApplicationController
  def index
    @students = []
    if params[:department].present? && (current_user.admin? || current_user.tutor?)
      @department = Department.find(params[:department])
      @course = params[:course].to_i
      @group = params[:group].to_i
      @students = Student.where(department_id: params[:department], course: params[:course], group_num: params[:group]).order("name ASC")
    elsif current_user.user?
      @students = Student.where(user_id: current_user.id)
      @department = current_user.department
      @course = current_user.course
      @group = current_user.group
    end
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to students_path(department: params[:student][:department_id],
                                course: params[:student][:course],
                                group: params[:student][:group_num]), notice: "Студент добавлен"
    else
      raise "Ой, какая-то беда"
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.delete
    redirect_to students_path(department: @student.department_id, course: @student.course, group: @student.group_num), notice: "Студент удален"
  end

  def update
   @student = Student.find(params[:id])
   @student.update_attributes(params[:student])
   render nothing: true
  end
end
