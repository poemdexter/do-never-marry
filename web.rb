require 'sinatra'
require 'sinatra/activerecord'
require './bin/reason'
require 'uri'

db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/dnm')

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

get '/' do
  @random_reason = Reason.random
  erb :index
end

post '/' do
  @reason = Reason.new(params)
  @reason.save
  redirect '/'
end

get '/admin' do
  @reasons = Reason.all
  erb :admin
end

get '/delete/:id' do
  @reason = Reason.find(params[:id])
  @reason.delete
  redirect '/admin'
end

get '/getrandom' do
  Reason.random.text
end