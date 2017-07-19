class User < ActiveRecord::Base
  def self.user_create_by_name(param_name)
    user = User.new
    user.name = param_name
    user.save
  end

  def self.users_count
    User.all.count
  end

  def self.find_first_name
    User.all.first.name
  end

  def self.find_using_where_clause_and_sorted
    User.where("jobs > 100").order(name: :desc)
  end
end
