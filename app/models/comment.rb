class Comment < ActiveRecord::Base
  include PublicActivity::Model
  acts_as_voteable

  belongs_to :user
  belongs_to :commentable, polymorphic: true

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
