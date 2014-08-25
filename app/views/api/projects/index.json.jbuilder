# collection :@projects
# attributes :id, :name
# node(:path) { |project| picture_path(project) }
# node(:thumb_path) { |project| project.path.small_thumb.url }

json.cache! @projects, expires_in: 1.hour do
  json.array! @projects do |project|
    json.id project.id
    json.name project.name
    json.url single_page_path(anchor: "!/projects/#{project.id}")
    json.thumb_url project.path.small_thumb.url
  end
end
