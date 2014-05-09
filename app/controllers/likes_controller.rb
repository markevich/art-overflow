class LikesController < InheritedResources::Base
  before_action :authenticate_user!
  belongs_to :user

  def index
    respond_with do |format|
      format.html do
        if request.xhr?
          render collection
        end
      end
    end
  end

  private

  PAGE_SIZE = 15
  helper_method :page, :order, :collection

  def page
    @page ||= (params[:page] || 1).to_i
  end

  def order
    return({ params[:order] => :desc }) if Like.column_names.include?(params[:order])

    { created_at: :desc }
  end

  def collection
    @collection ||= begin
      offset = (page - 1) * PAGE_SIZE

      end_of_association_chain.includes(:user).limit(PAGE_SIZE).offset(offset).order(order)
    end
  end
end
