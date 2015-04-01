class CreateCourses < ActiveRecord::Migration
  def change
    create_tables :courses do |t|
      t.string    :name, null: false
      t.integer   :course, null: false
      t.integer   :slope, null: false

      t.timestamps null:false
    end
  end
end
