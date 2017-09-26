require 'sinatra'
require 'sinatra/reloader'
require './lib/word_definer'
require './lib/definition'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/words') do
  @words = Word.all
  erb(:words)
end


get('/words/new') do
  erb(:words_formpage)
end

post('/words') do
  word = params.fetch('word')
  Word.new({:word => word}).save
  @words = Word.all
  erb(:success)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:word)
end

get('/words/:id/definitions/new') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:definition_form)
end

post('/words/:id') do
  definition = params.fetch('definition')
  @word = Word.find(params.fetch('word_id').to_i)
  @word.add_definitions(Definition.new({:definition => definition}))
  erb(:success)
end
