class User
  attr_accessor :id, :name, :jobs, :hours_worked, :job_success

  def self.all
    DB.execute("SELECT * FROM users").map do |row|
      user              = self.new
      user.id           = row[0]
      user.name         = row[1]
      user.jobs         = row[2]
      user.hours_worked = row[3]
      user.job_success  = row[4]
      user
    end
  end

  def self.find_by_name(name)
    DB.execute("SELECT * FROM users WHERE name = ? LIMIT 1", name)[0]
  end
end
