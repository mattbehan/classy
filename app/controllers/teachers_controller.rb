require 'csv'

include TeachersHelper

class TeachersController < ApplicationController

  before_filter :teacher_signed_in?
  before_filter :authorized?(params[:teacher_id]), only: [:update]
  before_filter :admin?, only: [:upload]
  before_action :find_teacher, only: [:show, :edit, :update]

  def index
    @teachers = Teacher.all
  end

  def show
  end

  def edit
  end

  def update
    @teacher = update_attributes(teacher_update_params)
  end

  def upload
    uploaded_file = params[:file]
    file_content = uploaded_file.read
    students = CSV.parse(file_content)
    students[1..-1].each do |student|
      s = Student.new(first_name:   student[0].to_s, # first_name
                      last_name:    student[1].to_s, # last_name
                      gender:       student[2].to_s,
                      grade:        student[3].to_i, # grade
                      gpa:          student[4].to_f, # gpa
                      detentions:   student[5].to_i, # detentions
                      t_shirt_size: student[6].to_s) # t_shirt_size
      s.save
    end
    redirect_to root_url
  end

  protected

  def teacher_update_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end

end
