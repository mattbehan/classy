module TeachersHelper
  def find_teacher
    @teacher = Teacher.find(params[:id])
  end
end
