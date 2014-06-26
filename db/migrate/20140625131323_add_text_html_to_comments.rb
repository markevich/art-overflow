class AddTextHtmlToComments < ActiveRecord::Migration
  def change
    add_column :comments, :text_html, :text
    add_column :pictures, :description_html, :text
  end
end
