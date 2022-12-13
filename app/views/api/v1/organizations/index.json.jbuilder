json.array! @organizations do |organization|
  json.extract! organization, :id, :name, :address
end
