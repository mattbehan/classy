class StudentsController < ApplicationController

  before_filter :authorized?(params[:teacher_id]), only: [:detentions]


  def index
    @teacher = Teacher.find(params[:teacher_id])
    @students = Student.where(teacher_id: @teacher.id)
  end

  def detentions
    @student = Student.find(params[:student_id])
    @student.detentions += 1
    @student.save
  end


end
