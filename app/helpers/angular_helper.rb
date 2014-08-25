module AngularHelper
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
end