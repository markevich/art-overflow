json.cache! @project do
  json.extract! @project, :id, :graphics_type, :name,
                          :description, :created_at,
                          :updated_at, :comments_count,
                          :likes_count, :view_count

  json.asset_url @project.path.url

  json.categories @project.categories do |category|
    json.name category.name
    json.link "/#{category.name}"
  end

  json.tags @project.tags do |tag|
    json.name tag.name
    json.link "/#{tag.name}"
  end

  json.user do
    json.id @project.user.id
    json.name @project.user.name
    json.followers_count @project.user.followers_count
    json.avatar_url @project.user.avatar.url
  end
end
