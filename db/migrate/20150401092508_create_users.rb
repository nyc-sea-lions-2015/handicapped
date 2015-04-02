class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username,        null: false # Database constraints are YAY!
      t.string  :password_digest, null: false

      t.timestamps null:false
    end
  end
end
