module ApplicationHelper
  def active_link_to(name, path, options = {})
    options[:class] = 'active' if request.fullpath == path

    content_tag(:li, class: options[:class]) do
      link_to(name, path, options)
    end
  end
end
