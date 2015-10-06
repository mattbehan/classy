class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :validatable, :confirmable
  has_many :students

  validates :email, uniqueness: true
  # Prevents an invalid email address from being added to the database.
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, :last_name, presence: true

  def self.add_detention(student)
    student.detentions += 1
    student.save
  end

  # Sets the passed in teacher as an admin IF the current teacher is an admin.
  def set_admin(teacher)
    self.admin ? teacher.admin = true : nil
  end

  def average_GPA
    students.sum(:gpa) / students.count
  end

  def total_detentions
    students.sum(:detentions)
  end

  def average_detentions
    total_detentions / students.count
  end

  def not_admin
  end

end
