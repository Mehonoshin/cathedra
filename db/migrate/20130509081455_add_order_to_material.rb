class AddOrderToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :priority, :integer, default: 0
  end
end
