class TeacherController < ApplicationController

  def add_detention_to_student
    @student = Student.find(params[:id])
    @student.detentions += 1
    @student.save
  end

end
