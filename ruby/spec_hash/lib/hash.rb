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

def hash_each(hash)
  hash.each { |k, v| puts "Hello, name: #{k}, age: #{v}." }
end

def all_posts
  {
    1 => { title: 'First post', 
    	   tags: %w[first post], 
    	   user_id: 1, 
    	   comments: [
    	   	          { body: 'First comment', user_id: 1 }, 
    	   	          { body: 'Good post!', user_id: 4 }
    	   	        ] 
    	},
    2 => { title: 'Second post', tags: %w[second post], user_id: 1 },
    3 => { title: 'Ruby on Rails', tags: %w[ruby], user_id: 2 }
  }
end
