class AddBioToParties < ActiveRecord::Migration
  def change
    add_column :parties, :bio, :text
  end
end
