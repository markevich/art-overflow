class Like < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true, counter_cache: true
end
