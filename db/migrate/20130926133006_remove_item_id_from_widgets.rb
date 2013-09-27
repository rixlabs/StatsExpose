class RemoveItemIdFromWidgets < ActiveRecord::Migration
  def change
    remove_column :widgets, :item_id, :integer
  end
end
