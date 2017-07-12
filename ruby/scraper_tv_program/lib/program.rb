class Program
  attr_accessor :id, :title, :tv_programs

  @@all = []

  def initialize
  	@@all << self
  end
  # Programs.all[0]
  def self.all
  	@@all
  end

  def self.reset_all
    @@all.clear
  end
end
