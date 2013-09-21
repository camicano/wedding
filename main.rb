require 'sinatra'
require 'active_record'

require_relative './models/person'
require_relative './models/message'

ActiveRecord::Base.establish_connection(ENV['HEROKU_POSTGRESQL_BROWN_URL'] || 'postgres://localhost/wedding')

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
  if params[:rsvp] == "yes"
     rsvp = "yes"
   else 
     rsvp = "no"
    end  

  num_ppl = params[:num_ppl]
  thu = params[:thu]
  fri = params[:fri]
  sat = params[:sat]
  arrival = params[:arrival]
  departure = params[:departure]
  tranportation = params[:tranportation]
  special_needs = params[:special_needs]

  person = Person.new
  person.name = name
  person.email = email
  person.num_ppl = num_ppl
  person.rsvp = rsvp
  person.house_thu = thu
  person.house_fr = fri
  person.house_sat = sat
  person.transportation = tranportation
  person.arrival = arrival
  person.departure = departure
  person.special_needs = special_needs
  person.save

  redirect '/wedding/thanks'
  erb :form
end

get '/wedding/thanks' do
  erb :thanks
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





