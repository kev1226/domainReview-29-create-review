require 'sinatra'
require 'json'
require_relative 'controllers/reviews_controller'
require_relative 'utils/jwt_helper'

before do
  pass if request.path_info == '/' || request.request_method == 'OPTIONS'

  header = request.env['HTTP_AUTHORIZATION']
  halt 401, { error: 'Token requerido' }.to_json if header.nil?

  token = header.split(' ').last
  begin
    @current_user = JWTHelper.decode_token(token)
  rescue => e
    halt 403, { error: "Token inválido: #{e.message}" }.to_json
  end
end

get '/' do
  { message: 'Review service running' }.to_json
end

post '/reviews' do
  ReviewsController.new.create(request, @current_user)
end
