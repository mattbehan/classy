class Student < ActiveRecord::Base
  belongs_to :teacher

  def full_name
    first_name + " " + last_name
  end
end
