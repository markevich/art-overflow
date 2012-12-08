class CommentsController < ApplicationController
  def create
    @drawing = Drawing.find(params[:comment][:commentable_id])
    @comment = Comment.build_from(@drawing, current_user.id, params[:comment][:body])

    @comment.save
    #TODO: никаких редиректо, это должно обрабатываться аяксом
    redirect_to drawing_path(params[:drawing_id])
  end
end