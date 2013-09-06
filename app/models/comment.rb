class Comment < ActiveRecord::Base
  include PublicActivity::Model

  belongs_to :user
  belongs_to :commentable, polymorphic: true, counter_cache: true

  validates :commentable_id, :commentable_type, :user_id, :text, presence: true

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
