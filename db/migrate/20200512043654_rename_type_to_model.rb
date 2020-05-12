class RenameTypeToModel < ActiveRecord::Migration[5.2]
  def change
    rename_column :listings, :type, :model
  end
end
