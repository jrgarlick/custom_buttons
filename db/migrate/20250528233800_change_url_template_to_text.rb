class ChangeUrlTemplateToText < ActiveRecord::Migration[5.2]
  def change
    change_column :custom_buttons, :url_template, :text
  end
end
