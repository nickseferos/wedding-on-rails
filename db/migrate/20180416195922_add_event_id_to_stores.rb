class AddEventIdToStores < ActiveRecord::Migration
  def change
    add_reference :stores, :event_id, index: true
  end
end
