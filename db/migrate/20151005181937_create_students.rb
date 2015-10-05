class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :grade, null: false
      t.float :gpa, null: false
      t.integer :detentions, null: false
      t.string :t_shirt_size, null: false
      t.belongs_to :teacher, index: true

      t.timestamps null: false
    end
  end
end
