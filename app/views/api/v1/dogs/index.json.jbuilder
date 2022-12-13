json.array! @dogs do |dog|
  json.extract! dog, :id, :name, :url, :breed, :gender, :size, :coat, :tags, :description, :color, :attributes, :environment, :photos, :organization_id
end
