module ApplicationHelper
  def active_link_to(name, path, options = {})
    options[:class] = 'active' if request.fullpath == path

    content_tag(:li, class: options[:class]) do
      link_to(name, path, options)
    end
  end

  def time_passed_from_creation(resource)
    "#{distance_of_time_in_words(resource.created_at, Time.now)} назад"
  end
end
