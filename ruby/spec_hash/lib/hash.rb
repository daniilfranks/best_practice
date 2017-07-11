def my_hash
  { name: 'Den', age: 26 }
end

def show_hash
  my_hash[:name]
end

def update_name_hash(param)
  my_hash = { name: 'Den', age: 26 }
  my_hash[:name] = param
  my_hash
end
