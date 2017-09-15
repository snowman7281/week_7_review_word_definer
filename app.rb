require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/word_definer'


get('/') do
  @error = nil
  @word = WordsList::Words.all
  erb(:words_list)
end

post('/') do
  attributes = {:word => params["word-input"]}
  word = WordsList::Words.new(attributes)
  word.save
  @word = WordsList::Words.all
  erb(:words_list)
end

get('/word/:word_route') do
  word = params[:word_route].split('_').join(' ')
  @word = WordsList::Words.find(word)
  erb(:words)
end

post('/word_edit/:word_route') do
  word = params[:word_route].split('_').join(' ')
  @word = WordsList::Words.find(word)
  erb(:word_edit)
end

post('/words/:word_route') do
  word = params[:word_route].split('_').join(' ')
  @word = WordsList::Words.find(word)
  @word.word = params["word-input"]

  count = 0
  while params.has_key?("definition-input-" + count.to_s)
    definition_input = params["definition-input-" + count.to_s]
    if definition_input.length != 0
      author_input = params["author-input" + count.to_s]
      if author_input.length == 0
        @word.add_definitions(definition_input)
      else
        @word.add_definitions(definition_input, author_input)
      end
    end
    count += 1
  end

  post("/delete/:word_route") do
    @word_word = params[:word_route].split('_').join(' ')
    word.delete
    erb("delete")
  end

end
