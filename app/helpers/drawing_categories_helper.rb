module DrawingCategoriesHelper

  def drawing_categories
    #TODO caching
    DrawingCategory.all
  end

  def nested_drawing_categories categories, current_category
    res = categories.map do |category, sub_categories|
      is_current = category == current_category

      text = render(category, is_current: is_current)
      text += content_tag(:div, nested_drawing_categories(sub_categories, current_category), :class => "nested_categories") unless sub_categories.empty?    
      text 
    end.join.html_safe
  end
end
