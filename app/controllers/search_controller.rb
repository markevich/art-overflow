class SearchController < ApplicationController
  def index
    @users = User.search(URI.escape(params[:query]))
  end

  def permitter_params
    params.permit(:query)
  end
end
