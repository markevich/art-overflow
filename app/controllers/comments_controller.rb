class CommentsController < ApplicationController
  def create
    @drawing = Drawing.find(params[:comment][:commentable_id])
    @comment = Comment.build_from(@drawing, current_user.id, params[:comment][:body])

    #что это за иф такой??? зачем он сдесь?
    if @comment.save
      redirect_to drawing_path(params[:drawing_id])
    else
      redirect_to drawing_path(params[:drawing_id])
    end
  end
end