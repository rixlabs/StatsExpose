class AddSizeToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :size, :string
  end
end
