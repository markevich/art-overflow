class UpdateThumbs < ActiveRecord::Migration
  def change
    Picture.all.each { |p| p.path.recreate_versions!(:small_thumb) }
  end
end
