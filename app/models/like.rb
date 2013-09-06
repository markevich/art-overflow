class Like < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true, dependent: :destroy, counter_cache: true
end
