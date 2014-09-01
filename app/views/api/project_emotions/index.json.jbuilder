json.cache! [@project, :emotions], expires_in: 1.day do
  json.array! @emotions do |emotion|
    json.id emotion.id
    json.project_id emotion.picture_id
    json.user_id emotion.user_id
    json.type emotion.type
  end
end
