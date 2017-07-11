# class Song
class Song
  attr_accessor :name, :artist_name, :time

  @@all = []

  def self.create(params)
  	song = self.new
  	song.name = params[:name]
  	song.artist_name = params[:artist_name]
  	song.time = Time.new.to_s
  	song.save
  	song
  end

  def self.new_by_name(param)
    song = self.new
    song.name = param
    song
  end

  def self.create_by_name(param)
    song = self.new
    song.name = param
    song.save
    song
  end

  def self.find_by_name(param)
    self.all.each { |variable| return variable if variable.name === param }
  end

  def self.destroy_all
  	self.all.clear
  end

  def self.all
  	@@all
  end

  def save
  	self.class.all << self
  end
end
