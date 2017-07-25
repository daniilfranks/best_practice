class App
 @@items = %w[apple book car]

 def call(env)
   res = Rack::Response.new
   req = Rack::Request.new(env)

   case req.path_info
   when '/'
   	  res.write('Hello app!')
   	  res.status = 200
   when '/items'
   	  @@items.map { |item| res.write("#{item}\n") }
   	  res.status = 200
   else
   	  res.status = 404
   	  res.write(404)
   end

   res.finish
 end
end
