module PictureWorld
  def picture
    @picture
  end

  def create_picture
    @picture ||= create(:picture)
  end

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
