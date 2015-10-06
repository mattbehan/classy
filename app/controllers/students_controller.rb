class StudentsController < ApplicationController

  include StudentsHelper

  before_filter only: [:update] { allowed?(params[:teacher_id]) }
  before_filter :not_admin?, only: [:remove_from_classroom]
  before_filter :find_teacher
  before_filter :find_student


  def all
    @students = Student.all
    render :all
  end

  def index
  end

  def student_already_assigned
    render :student_already_assigned
  end

  def detentions
    Teacher.add_detention(@student)
  end

# not sure where to render on either of these since student button needs to be able to be clicked from both student show
  def add_to_classroom
    if @student.teacher == nil
      @teacher.students << @student
      render :"teachers/index"
    else
      render :"teachers/index"
    end

  end

  def remove_from_classroom
    @student.teacher = nil
    @studnet.save
  end

  def show
    @student = Student.find(params[:id])
  end

end
