require 'csv'

class TeachersController < ApplicationController

  def upload

    uploaded_file = params[:file]

    # CSV.foreach(uploaded_file) # Matts way

    file_content = uploaded_file.read

    p file_content.class

    students = CSV.parse(file_content)

    p students.class

    students[1..-1].each do |student|

      # p student[0] # first_name
      # p student[1] # last_name
      # p student[2] # grade
      # p student[3] # gpa
      # p student[4] # detentions
      # p student[5] # t_shirt_size
      # p student[6] # teacher

      # s = Student.new(first_name: student[0].to_s,
      #                 last_name: student[1].to_s,
      #                 grade: student[2].to_i,
      #                 gpa: student[3].to_f,
      #                 detentions: student[4].to_i,
      #                 t_shirt_size: student[5].to_s,
      #                 teacher: student[6].to_s)
      #
      # s.save

    end


    redirect_to root_url
  end

end
