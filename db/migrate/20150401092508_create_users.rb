class CreateUsers < ActiveRecord::Migration
  def change
    create_tables :users do |t|
      t.string  :username, null:false
      t.string  :password_digest, null: false

      t.timestamps null:false
    end
  end
end
