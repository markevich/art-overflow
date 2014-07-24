class AddPictureCategoriesTable < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :categories_pictures, id: false do |t|
      t.integer :picture_id
      t.integer :category_id

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Category::KEYS.each do |name|
          Category.create(name: name)
        end
      end
    end

    add_index :categories_pictures, [:category_id, :picture_id], unique: true
    add_index :categories_pictures, :picture_id
    add_index :categories, :name
  end
end
