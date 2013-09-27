class RemoveListFromWidgets < ActiveRecord::Migration
  def change
    remove_column :widgets, :list, :string
  end
end
