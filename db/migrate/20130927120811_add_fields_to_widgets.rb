class AddFieldsToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :endpoint, :string
    add_column :widgets, :chart_type, :string
    add_column :widgets, :title, :string
    add_column :widgets, :indicator, :string
    add_column :widgets, :description, :text
  end
end
