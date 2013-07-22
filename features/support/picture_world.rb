module PictureWorld
  def picture
    @picture
  end

  def create_picture(user)
    @picture ||= create(:picture, user: user)
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

  def picture_like_button
    I18n.t('pictures.like')
  end  

  def picture_unlike_button
    I18n.t('pictures.unlike')
  end
end

World(PictureWorld)
