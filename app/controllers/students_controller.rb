class StudentsController < ApplicationController

  def index
    @teacher = Teacher.find(params[:teacher_id])
    @students = Student.where(teacher_id: @teacher.id)
  end

end
