class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :validatable, :confirmable
  has_many :students

  validates :email, uniqueness: true

  def add_detention(student)

  end

  # Sets the passed in teacher as an admin IF the current teacher is an admin.
  def set_admin(teacher)
    self.admin ? teacher.admin = true : nil
  end

end
