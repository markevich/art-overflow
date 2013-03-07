module  DrawingHelper
  def like_drawing_button drawing
    return unless current_user
    if current_user.voted_for?(drawing)
      button_to("UnLike", drawing_unlike_path(drawing), remote: true, class: 'btn btn-warning', form: {id: 'unlike_form'})
    else
      button_to("Like", drawing_like_path(drawing), remote: true, class: 'btn btn-primary', form: {id: 'like_form'})
    end
  end

end
