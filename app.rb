require 'sinatra'
require 'json'

get '/' do
  file = File.read(File.expand_path('../data.json', __FILE__))
  @data = JSON::parse(file)
  @percentage = (@data["current"].to_f / @data["target"].to_f) * 100
  erb :index
end

get '/edit' do
  file = File.read(File.expand_path('../data.json', __FILE__))
  @data = JSON::parse(file)
  erb :edit
end

post '/update' do
  File.write(File.expand_path('../data.json', __FILE__), params.to_json)
  redirect "/"
end
