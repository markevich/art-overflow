class Drawing < ActiveRecord::Base
  validates :name, :drawing_category_id, presence: true, on: :update
  validates :path, presence: true, on: :create
  before_create :save_meta_info

  acts_as_commentable
  acts_as_viewable
  acts_as_taggable

  belongs_to :user
  belongs_to :drawing_category

  mount_uploader :path, DrawingUploader
  
  serialize :meta_info

  def comments
  	Comment.find_comments_for_commentable(self.class.base_class.name, self.id)
  end

  private
  def save_meta_info
    self.meta_info = get_meta_from(path).merge({
      thumb: get_meta_from(path.thumb)
    })
  end

  def get_meta_from picture
    picture = ::MiniMagick::Image::read(File.binread(picture.file.file))
    {
      width: picture[:width],
      height: picture[:height] 
    }
  end
end
