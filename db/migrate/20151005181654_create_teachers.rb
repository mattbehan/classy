class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.boolean :admin?, default: false, null: false

      t.timestamps null: false
    end
  end
end
