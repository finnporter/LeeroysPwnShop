require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

get '*/' do
  erb(:index)
end