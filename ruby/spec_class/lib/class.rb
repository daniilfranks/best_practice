# Class User
class User
  attr_accessor :name, :role

  def initialize(name, role)
    @name = name
    @role = role
  end

  def hello
    'Hello user'
  end
end

# Class Role
class Role
  attr_accessor :name, :role

  def initialize(name = 'base', role = 1)
    @name = name
    @role = role
  end
end
