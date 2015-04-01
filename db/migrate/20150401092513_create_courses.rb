class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string    :name, null: false
      t.float   :course, null: false
      t.float   :slope, null: false

      t.timestamps null:false
    end
  end
end
