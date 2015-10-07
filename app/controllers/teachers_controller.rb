require 'csv'


class TeachersController < ApplicationController

  include TeachersHelper

  # before_filter only: [:update] { allowed?(params[:teacher_id]) }
  # before_filter :not_admin?, only: [:upload, :admin, :remove_from_classroom]
  # before_filter :find_teacher, only: [:show, :edit, :update]

  def admin
    render :admin
  end

  def not_authorized
    render :not_authorized
  end

  def not_admin
    render :not_admin
  end

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

  def make_admin
    @teacher = Teacher.find(params[:id])
    @teacher.admin = true
    @teacher.save
    flash[:notice] = "#{@teacher.full_name} was succesfully set as an admin."
    redirect_to root_path
  end

  def remove_admin
    @teacher = Teacher.find(params[:id])
    @teacher.admin = false
    @teacher.save
    flash[:notice] = "#{@teacher.full_name} has been removed as an admin."
    redirect_to root_path
  end

  def upload

    if request.xhr?

      begin

        # setup for parsing
        uploaded_file = params[:file]
        file_content = uploaded_file.read
        students = CSV.parse(file_content)

        # parses data
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

        # response to ajax call
        render inline: "File uploaded!"


      rescue Exception => e

        @error = e
        # response to ajax call
        render inline: "The upload failed.\n\nPlease contact admin.\n\nError details: <%= @error %>"

      end # end of error handling

    else

      render nothing: true

    end # end if xhr
  end # end of method

  def sign_up_params
    params.require(:teacher).permit(:first_name, :last_name, :email,
                                      :password, :password_confirmation)
  end

  def new_session
    @teacher = Teacher.new
    render :"teachers/registrations/new"
  end


  protected

  def teacher_update_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end

end
