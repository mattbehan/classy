require 'csv'

class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def upload

    if request.xhr?
      # raise params[:file]
      p params[:file]
      p "hi"

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

    # uploaded_file = params[:file]
    # file_content = uploaded_file.read
    # students = CSV.parse(file_content)
    # students[1..-1].each do |student|
    #   s = Student.new(first_name:   student[0].to_s, # first_name
    #                   last_name:    student[1].to_s, # last_name
    #                   gender:       student[2].to_s,
    #                   grade:        student[3].to_i, # grade
    #                   gpa:          student[4].to_f, # gpa
    #                   detentions:   student[5].to_i, # detentions
    #                   t_shirt_size: student[6].to_s) # t_shirt_size
    #   s.save
    # end
    # redirect_to root_url
  end

end
