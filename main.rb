require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'active_support/all'
require 'digest/sha2'

enable :sessions

require_relative './models/person'

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

# home page with form in english
get '/wedding/en/:id' do
  erb :form
end

# post the form
post '/wedding/en/:id' do
  @guest = Person.find(params[:id])

  redirect '/wedding/thank-you'
  erb :form
end

# Thank you page (that becomes main page once the person rsvps) has a link to -> message board, 
# -> contact, map, other relevant info, wedding party. -> gift registry? -> edit form.
get '/wedding/thank-you' do
  erb :home
end

get '/wedding/board' do
  erb :board
end

get 'wedding/information' do
  erb :info
end

get 'wedding/registry' do
  erb :registry
end

get 'wedding/:id/edit' do
  erb :edit
end

# hidden link that shows the tables with all the info.
get 'wedding/lista' do
  erb :lista
end 







