collection :@projects
attributes :id, :name
node(:path) { |project| picture_path(project) }
node(:thumb_path) { |project| project.path.small_thumb.url }
