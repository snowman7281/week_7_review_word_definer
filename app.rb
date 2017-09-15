require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/word_definer'
require 'pry'

get('/') do
  @words = WordsList::Words.all
  erb(:words_list)
end

post('/') do
  attributes = {:words => params["word"]}
  word = WordsList::Words.new(attributes)
  word.save
  @words = WordsList::Words.all
  erb(:words_list)
end
