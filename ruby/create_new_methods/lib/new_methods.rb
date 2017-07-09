def square_array(array)
  new_arr = []
  array.each do |i|
    new_arr.push(i**2)
  end
  new_arr
end

def hello(name)
  "Hello, #{name}."
end

def arr_messages(array)
  messages = []
  array.each do |i|
    messages.push(hello(i))
  end
  messages
end

def add_messages(array)
  messages = []
  array.each_with_index do |name, i|
    messages.push("Hello, #{name}, you index #{i + 1}.")
  end
  messages
end
