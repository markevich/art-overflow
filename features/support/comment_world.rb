module CommentWorld
  def comment_text
    "Not perfect, but still fun."
  end
  def like_comment
    click_button I18n.t('the_comments.like')
  end

  def unlike_comment
    click_button I18n.t('the_comments.unlike')
  end

  def likes_for_comment_count
    count = find('.likes_count')
    count.text.to_i
  end
end

World(CommentWorld)
