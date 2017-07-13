class User
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
