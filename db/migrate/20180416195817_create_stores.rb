class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :logo
      t.string :link
      t.string :event_id

      t.timestamps
    end
  end
end
