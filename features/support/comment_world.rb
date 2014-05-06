module CommentWorld
  def comment_text
    "Not perfect, but still fun."
  end

  def like_comment_link
    I18n.t('like')
  end

  def write_comment
    fill_in('comment[text]', with: comment_text)
    click_button I18n.t('comment.create')
  end

  def like_comment
    within '.comments' do
      click_link like_comment_link
    end
  end

  def unlike_comment
    like_comment
  end

  def likes_for_comment_count
    within '.comments' do
      count = find('.counter')
      count.text.to_i
    end
  end
end

World(CommentWorld)
