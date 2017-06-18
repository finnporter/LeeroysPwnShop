require 'sinatra'
require 'sinatra/contrib/all'

require_relative 'controllers/products_controller.rb'
#breaks code for some reason

get '/' do
  erb(:index)
end