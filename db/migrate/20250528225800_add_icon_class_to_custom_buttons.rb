class AddIconClassToCustomButtons < ActiveRecord::Migration[5.2]
  def change
    add_column :custom_buttons, :icon_class, :string, default: ''
  end
end
