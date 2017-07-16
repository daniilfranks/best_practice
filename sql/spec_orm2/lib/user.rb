class User
  attr_accessor :name, :jobs, :hours_worked, :job_success
  attr_reader :id

  def initialize(name, jobs, hours_worked, job_success, id = nil)
    @id           = id
    @name         = name
    @jobs         = jobs
    @hours_worked = hours_worked
    @job_success  = job_success
  end

  def self.create(name, jobs, hours_worked, job_success)
    user = User.new(name, jobs, hours_worked, job_success)
    user.save
    user
  end

  def self.create_table
    DB.execute("CREATE TABLE users(
              users_id     integer PRIMARY KEY,
              name         text    UNIQUE NOT NULL,
              jobs         integer DEFAULT 0,
              hours_worked integer DEFAULT 0,
              job_success  integer DEFAULT 0
            )")
  end

  def self.drop_table
    DB.execute('DROP TABLE users')
  end

  def self.insert_fake_users
    DB.execute("INSERT INTO users(name, jobs, hours_worked, job_success)
                        VALUES 
                              ('Den', 7, 319, 98),
                              ('Alan', 10, 810, 87),
                              ('Leo', 1, 2, 99),
                              ('Mark', 2, 3, 100),
                              ('Jok', 6, 1800, 95),
                              ('Ahmed', 16, 300, 50),
                              ('Valera', 4, 11, 70),
                              ('Enot', 1, 1, 100)
                     ")
  end

  def save
    sql = "INSERT INTO users(name, jobs, hours_worked, job_success)
           VALUES(?, ?, ?, ?)"
    DB.execute(sql, self.name, self.jobs, self.hours_worked, self.job_success)
    @id = DB.execute('SELECT last_insert_rowid() FROM users')[0][0]
  end

  def all
    "SELECT * FROM users"
  end

  def user_max_jobs
    "SELECT MAX(jobs) AS max_jobs FROM users"
  end

  def user_min_jobs
    "SELECT MIN(jobs) AS max_jobs FROM users"
  end

  def user_avg_jobs
  	"SELECT AVG(jobs) FROM users"
  end

  def user_sum_jobs
  	"SELECT SUM(jobs) FROM users"
  end
end
