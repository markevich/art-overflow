class AddShortBodyToNews < ActiveRecord::Migration
  def change
    add_column :news, :short_body, :text
  end
end
