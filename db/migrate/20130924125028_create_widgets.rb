class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.references :dashboard, index: true
      t.integer :item_id
      t.string :list
      t.integer :sequence
      t.text :content

      t.timestamps
    end
  end
end
