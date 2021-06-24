class RenameRoductStatusIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :roduct_status_id, :product_status_id
  end
end
