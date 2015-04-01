class CreateScores < ActiveRecord::Migration
  def change
    create_tables :scores do |t|
      t.references :user
      t.references :course
      t.integer    :strokes

      t.timestamps null:false
    end
  end
end
