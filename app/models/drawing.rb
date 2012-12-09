class Drawing < ActiveRecord::Base
  attr_protected :user_id

  acts_as_commentable
  acts_as_viewable
  
  belongs_to :user
  belongs_to :drawing_category

  mount_uploader :path, DrawingUploader

  def comments
  	Comment.find_comments_for_commentable(self.class.base_class.name, self.id)
  end
end
