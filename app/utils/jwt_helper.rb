require 'jwt'

module JWTHelper
  def self.decode_token(token)
    secret = ENV['JWT_SECRET']
    decoded = JWT.decode(token, secret, true, { algorithm: 'HS256' })
    decoded[0] # payload
  rescue JWT::DecodeError => e
    raise "Invalid token: #{e.message}"
  end
end
