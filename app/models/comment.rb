class Comment < ActiveRecord::Base
  include Trackable

  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true, touch: true
  has_many :likes, as: :likeable, dependent: :destroy

  validates :commentable_id, :commentable_type, :user_id, :text, presence: true

  delegate :name, to: :user, prefix: true
  delegate :avatar, to: :user, prefix: true
  alias_method :activity_owner, :user

  auto_html_for :text do
    html_escape
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  def recipient
    commentable.user
  end

  # Define your filters for content
  # Expample for: gem 'RedCloth', gem 'sanitize'
  # your personal SmilesProcessor
  # def prepare_content
  #   text = self.raw_content
  #   text = RedCloth.new(text).to_html
  #   text = SmilesProcessor.new(text)
  #   text = Sanitize.clean(text, Sanitize::Config::RELAXED)
  #   self.content = text
  # end
end
