class AddEventIdToParties < ActiveRecord::Migration
  def change
    add_index :parties, :event_id
  end
end
