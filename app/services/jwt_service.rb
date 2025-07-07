require 'jwt'

def authorize_request
  header = request.env['HTTP_AUTHORIZATION']
  halt 401, { error: 'Token requerido' }.to_json if header.nil?

  token = header.split(' ').last
  begin
    decoded = JWT.decode(token, ENV['JWT_SECRET'], true, algorithm: 'HS256')
    @current_user = decoded.first
  rescue JWT::DecodeError
    halt 403, { error: 'Token inválido' }.to_json
  end
end
