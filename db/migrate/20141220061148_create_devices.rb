class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :phone_number
      t.string :alias_name
      t.boolean :lock, default: false
      t.boolean :moving, default: false
      t.references :user

      t.timestamps
    end
  end
end
