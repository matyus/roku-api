class AddDefaultToRokuBoxPort < ActiveRecord::Migration[5.0]
  def change
    change_column_default :roku_boxes, :port, from: nil, to: "8060"
  end
end
