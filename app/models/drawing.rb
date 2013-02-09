class Drawing < ActiveRecord::Base
  validates :name, :drawing_category_id, presence: true, on: :update
  validates :path, presence: true, on: :create

  acts_as_commentable
  acts_as_viewable
  acts_as_taggable

  belongs_to :user
  belongs_to :drawing_category

  mount_uploader :path, DrawingUploader

  def comments
  	Comment.find_comments_for_commentable(self.class.base_class.name, self.id)
  end
end
