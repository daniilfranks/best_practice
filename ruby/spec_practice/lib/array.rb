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

def valid_integer?(param = 0)
  param.is_a?(Integer) && (1..10).cover?(param) ? true : false
end

def using_while
  levl = 5

  while levl < 9
  	puts 'Hi Balanar'
    levl += 1
  end
end
