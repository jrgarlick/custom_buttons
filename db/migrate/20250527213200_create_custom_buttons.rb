# plugins/custom_buttons/db/migrate/001_create_custom_buttons.rb
class CreateCustomButtons < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_buttons do |t|
      t.integer :tracker_id, null: false
      t.string :title_template, null: false
      t.string :url_template, null: false
      t.string :location, null: false, default: 'top' # 'top' or 'menu'
      t.integer :position, default: 0
      t.boolean :active, default: true, null: false
      t.timestamps
    end

    add_foreign_key :custom_buttons, :trackers
    add_index :custom_buttons, [:tracker_id, :position]
  end
end
