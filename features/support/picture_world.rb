module PictureWorld
  def picture
    @picture
  end

  def create_picture
    @picture ||= create(:picture)
  end
end

World(PictureWorld)
