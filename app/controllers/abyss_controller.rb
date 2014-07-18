class AbyssController < ApplicationController
  ORDER_FILTERS = [
    { key: 'likes_count', active: true, name: 'Популярные' },
    { key: 'created_at', active: false, name: 'Новые' }
  ].to_json
end
