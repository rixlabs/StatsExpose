class AddTitleToDashboards < ActiveRecord::Migration
  def change
    add_column :dashboards, :title, :string
  end
end
