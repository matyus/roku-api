class CreateRokuBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :roku_boxes do |t|
      t.string :ip_address, limit: 30
      t.string :port, limit: 8
      t.string :name

      t.timestamps
    end
  end
end
