class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :position
      t.string :image
      t.string :event_id

      t.timestamps
    end
  end
end
