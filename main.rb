require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'active_support/all'
require 'digest/sha2'

require_relative './models/person'
require_relative './models/message'

ActiveRecord::Base.establish_connection(ENV['HEROKU_POSTGRESQL_ROSE_URL'] || 'postgres://localhost/wedding')

ActiveRecord::Base.logger = Logger.new(STDOUT)

# before '/wedding*' do
#   if !current_user
#     redirect '/login'
#   end
# end

# get '/login' do
#   erb :login
# end

# post '/login' do
#   code = Digest::SHA2.hexdigest(params[:code])    
#   if user = User.find(:first, :conditions => {:username => code})

#     current_user = user

#     redirect '/'
#   else
#     erb :login  
#   end

#  redirect '/wedding'
# end


# Thank you page (that becomes main page once the person rsvps) has a link to -> message board, 
# -> contact, map, other relevant info, wedding party. -> gift registry? -> edit form.
get '/wedding/home' do
  erb :home
end

get '/wedding/board' do
  @messages = Message.all
  erb :board
end

post '/wedding/board' do
  message = Message.new(params[:message])
  message.save

  redirect '/wedding/board'
end

get '/wedding/info' do
  erb :info
end

get '/wedding/registry' do
  erb :registry
end

get '/wedding/rsvp' do
  erb :form
end

# hidden link that shows the tables with all the info.
get 'wedding/lista' do
  erb :lista
end 







