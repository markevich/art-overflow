module ApplicationHelper
  def categories_map
    Category::KEYS.map do |key|
      { key: key, active: false, name: I18n.t(key, scope: :categories) }
    end.to_json
  end

  def orders_map
    [
      { key: 'likes_count', active: true, name: 'Популярные' },
      { key: 'created_at', active: false, name: 'Новые' }
    ].to_json
  end

  def active_link_to(name, path, options = {})
    options[:class] = 'active' if request.fullpath == path

    content_tag(:li, class: options[:class]) do
      link_to(name, path, options)
    end
  end

  def time_passed_from_creation(resource)
    "#{distance_of_time_in_words(resource.created_at, Time.now)} назад"
  end

  def reformal_widget
    unless Rails.env.test?
      content_tag(:script, type: 'text/javascript') do
        "var reformalOptions = {
            project_id: 730495,
            project_host: 'cgninja.reformal.ru',
            tab_orientation: 'right',
            tab_indent: '50%',
            tab_bg_color: '#26394d',
            tab_border_color: '#FFFFFF',
            tab_image_url: 'http://tab.reformal.ru/T9GC0LfRi9Cy0Ysg0Lgg0L%252FRgNC10LTQu9C%252B0LbQtdC90LjRjw==/FFFFFF/2a94cfe6511106e7a48d0af3904e3090/left/1/tab.png',
            tab_border_width: 1
         };

         (function() {
           var script = document.createElement('script');
           script.type = 'text/javascript'; script.async = true;
           script.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'media.reformal.ru/widgets/v3/reformal.js';
           document.getElementsByTagName('head')[0].appendChild(script);
         })();".html_safe
      end
    end
  end
end
