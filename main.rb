require 'sinatra'
require 'active_record'

require_relative './models/person'
require_relative './models/message'

ActiveRecord::Base.establish_connection(ENV['HEROKU_POSTGRESQL_BROWN_URL'] || 'postgres://localhost/wedding')


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

post '/wedding/rsvp' do
  name = params[:name]
  email = params[:email]
  # if params[:rsvp] == "yes"
  #   rsvp = "yes"
  # else 
  #   rsvp = "no"
  # end  

  num_ppl = params[:num_ppl]
  thu = params[:house_thu]
  fri = params[:house_fri]
  sat = params[:house_sat]
  arrival = params[:arrival]
  departure = params[:departure]
  transportation = params[:transportation]
  special_needs = params[:special_needs]

  person = Person.new
  person.name = name
  person.email = email
  person.num_ppl = num_ppl
  # person.rsvp = rsvp
  person.house_thu = thu
  person.house_fr = fri
  person.house_sat = sat
  person.transportation = transportation
  person.arrival = arrival
  person.departure = departure
  person.special_needs = special_needs
  person.save

  redirect '/wedding/lista'
  erb :form
end

# hidden link that shows the tables with all the info.
get '/wedding/lista' do
  @rsvps = Person.all

  erb :lista
end 

get '/wedding/nuevo' do
  erb :nuevo
end 

post '/wedding/nuevo' do
  name = params[:name]
  email = params[:email]
  num_ppl = params[:num_ppl]

  person = Person.new
  person.name = name
  person.email = email
  person.num_ppl = num_ppl
  person.save

  redirect '/wedding/lista'
  erb :nuevo
end 





