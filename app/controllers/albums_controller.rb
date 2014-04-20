class AlbumsController < InheritedResources::Base
  belongs_to :user
  
  def permitted_params
    params
  end
end
