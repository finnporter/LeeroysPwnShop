require 'sinatra'
require 'sinatra/contrib/all'

require_relative 'controllers/products_controller.rb'
require_relative 'controllers/suppliers_controller.rb'

get '/' do
  erb(:index)
end