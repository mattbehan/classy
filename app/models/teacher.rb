class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :validatable, :confirmable
  has_many :students

  validates :email, uniqueness: true

  def add_detention(student)

  end

end
