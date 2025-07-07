require 'sinatra'
require 'dotenv/load'
require 'sinatra/cross_origin' 
require_relative 'config/database'
require_relative 'app/routes'

# Configuración de CORS
configure do
  enable :cross_origin
end

# Permitir todos los orígenes, métodos y headers
before do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization'
end

# Manejo de preflight requests (OPTIONS)
options '*' do
  200
end

set :port, ENV['PORT'] || 3079
set :bind, '0.0.0.0'
