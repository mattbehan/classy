module StudentsHelper
  def find_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def find_student
    @student = Student.find(params[:id])
  end
end
