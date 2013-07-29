module ScrollerWorld
  def scroll_to_next_page
    page.execute_script "$(window).data('scrolling', false)"
    page.execute_script "window.scrollBy(0, document.height)"
  end

  def scroll_to_bottom_of_screen
    page.execute_script "$(window).data('scrolling', false)"
    page.execute_script "window.scrollBy(0, screen.height)"
  end

end

World(ScrollerWorld)
