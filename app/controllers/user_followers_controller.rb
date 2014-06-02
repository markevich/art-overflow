class UserFollowersController < InheritedResources::Base
  actions :index

  defaults resource_class: Follow, collection_name: 'followings', instance_name: 'like'
  belongs_to :user

  helper_method :collection

  private

  def collection
    @collection ||= begin
      end_of_association_chain.includes(:follower).order(created_at: :desc)
    end
  end
end
