class AddEventIdToRegistries < ActiveRecord::Migration
  def change
    add_column :registries, :event_id, :string

    add_index :registries, :event_id
  end
end
