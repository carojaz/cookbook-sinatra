require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require_relative 'cookbook'
require_relative 'recipe'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

cookbook = Cookbook.new("recipes.csv")
get '/' do
  @recipes = cookbook.all
  erb :index
end

get '/new' do
  erb :new
end

post '/create' do
  name = params[:recipe_name]
  description = params[:recipe_description]
  rating = params[:recipe_rating]
  prep_time = params[:recipe_prep_time]
  recipe = Recipe.new({ name: name, description: description, rating: rating, prep_time: prep_time })
  cookbook.add_recipe(recipe)
  redirect "/"
end


