class Picture < ActiveRecord::Base
  include TheCommentsCommentable
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }, only: []
  validates :name, :path, :user_id, presence: true
  belongs_to :user
  belongs_to :gallery

  acts_as_voteable
  acts_as_taggable

  mount_uploader :path, PictureUploader


  # def commentable_title
  #   # by default: try(:title) || TheComments.config.default_title
  #   # for example: "My first blog post"
  #   name
  # end

  # def commentable_url
  #   # by default:  ['', self.class.to_s.tableize, self.to_param].join('/')
  #   # for example: "/blogs/1-my-first-blog-post"
  #   # ['', self.class.to_s.tableize, slug_id].join('/')
  # end

  # def commentable_state
  #   # by default:  try(:state)
  #   # for example: "draft"
  #   self.ban_flag == true ? :banned : :published
  # end
end
