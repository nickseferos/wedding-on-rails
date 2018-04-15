class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.string :store
      t.string :logo
      t.string :link

      t.timestamps
    end
  end
end
