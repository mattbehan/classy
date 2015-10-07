class StudentsController < ApplicationController

  include StudentsHelper

  before_filter only: [:update, :index] { allowed?(params[:teacher_id]) }
  before_filter :not_admin?, only: [:remove_from_classroom]
  before_filter :find_teacher, except: [:all, :show]
  before_filter :find_student, except: [:all, :index, :show]


  def all
    @students = Student.all
    render :all
  end

  def index
    @students = @teacher.students
  end

  def student_already_assigned
    render :student_already_assigned
  end

  def detentions
    Teacher.add_detention(@student)
    redirect_to @teacher
  end

# not sure where to render on either of these since student button needs to be able to be clicked from both student show
  def add_to_classroom
    if (@teacher.admin)
      redirect_to "teachers/not_authorized"
    elsif @student.teacher == nil
      @teacher.students << @student
      redirect_to :back
    else
      redirect_to :student_already_assigned
    end
  end

  def remove_from_classroom
    @student.teacher_id = nil
    @student.save
    redirect_to :back
  end

  def show
    @student = Student.find(params[:id])
  end

end
