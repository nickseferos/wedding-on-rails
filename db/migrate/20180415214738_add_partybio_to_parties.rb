class AddPartybioToParties < ActiveRecord::Migration
  def change
    add_column :parties, :partybio, :text
  end
end
