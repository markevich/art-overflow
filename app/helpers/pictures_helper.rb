module PicturesHelper
  def most_popular_pictures(user)
    user.pictures.order(:likes_count).limit(6).reverse_order
  end
end