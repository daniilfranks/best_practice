require 'jwt'

hmac_secret = 'a2b4hG9532zx'
hash = { user_id: 1 }
algorithm = 'HS256'

token = JWT.encode(hash, hmac_secret, algorithm)
puts token

decoded = JWT.decode(token, hmac_secret)
puts decoded

