class App
 def call(env)
   r = Rack::Response.new
   r.write('Hello app!')
   r.finish
 end
end
