class PictureLikesController < InheritedResources::Base
  actions :index

  defaults resource_class: Like, collection_name: 'likes', instance_name: 'like'
  belongs_to :picture

  private

  def collection
    @collection ||= begin
      end_of_association_chain.includes(:user).order(created_at: :desc)
    end
  end
end
