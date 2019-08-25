json.array! @children do |child|
  json.id child.id
  json.name child.name
end

json.array! @grandchildren do |grand|
  json.id grand.id
  json.name grand.name
end

json.array! @fee_parent do |fee|
  json.id fee.id
  json.name fee.name
end



