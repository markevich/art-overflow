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

  def picture_likes_count
    find('.picture-actions').find('.picture-likes-count').text.to_i
  end

  def like_picture_button
    find(:button, I18n.t('like'))
  end

  def unlike_picture_button
    like_picture_button
  end

  def like_picture
    like_picture_button.click
  end

  def unlike_picture
    unlike_picture_button.click
  end
end

World(PictureWorld)
