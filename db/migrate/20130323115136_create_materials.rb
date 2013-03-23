class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :title
      t.string :file
      t.string :category
      t.string :department

      t.timestamps
    end
  end
end
