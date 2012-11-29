class DashboardsController < ApplicationController
  def index
    @drawings = Drawing.last(20).reverse
  end
end