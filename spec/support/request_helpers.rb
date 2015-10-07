
include Warden::Test::Helpers

module RequestHelpers
  def create_logged_in_user
    teacher = Factory(:teacher)
    login(teacher)
    teacher
  end

  def login(teacher)
    login_as teacher, scope: :teacher
  end
end
