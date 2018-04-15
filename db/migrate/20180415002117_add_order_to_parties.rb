class AddOrderToParties < ActiveRecord::Migration
  def change
    add_column :parties, :order, :integer
  end
end
