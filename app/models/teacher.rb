class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :validatable, :confirmable, :registerable
  has_many :students

  validates :email, uniqueness: true
  # Prevents an invalid email address from being added to the database.
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def add_detention(student)

  end

  # Sets the passed in teacher as an admin IF the current teacher is an admin.
  def set_admin(teacher)
    self.admin ? teacher.admin = true : nil
  end

end
