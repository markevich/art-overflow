module PictureWorld
  def show_more_link
    first(:link, text: I18n.t('pictures.show_more'))
  end

  def create_many_pictures(count)
    picture = create(:picture)
    count.times do
      ActiveRecord::Base.transaction do
        picture.dup.save
      end
    end
  end
end

World(PictureWorld)
