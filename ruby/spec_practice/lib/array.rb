def resault
  %w[car book phone tv]
end

def languages(*arr)
  arr
end

def hello(name = 'Den')
  "Hello, #{name}"
end

def role(param = 1)
  case param
  when 1..5  then 'User'
  when 6..10 then 'Moderator'
  else
    'No valid role'
  end
end
