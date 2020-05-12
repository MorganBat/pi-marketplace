class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :type
      t.float :price
      t.text :software
      t.text :description

      t.timestamps
    end
  end
end
