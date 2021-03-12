#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3 }
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :barber, presence: true
	validates :color, presence: true				
end

class Barber < ActiveRecord::Base 
end	

class Contact < ActiveRecord::Base 
end	

before do
	@barbers = Barber.all
end	


get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do
#  ---ЗАПИСЬ КЛИЕНТОВ (МОЙ ВАРИАНТ 1)-LAMER---

	@user_name = params[:user_name]
	@user_date = params[:user_date]
	@user_phone = params[:user_phone]
	@user_selection = params[:user_selection]
	@color = params[:color]

	@cl = Client.new do |att|
		att.name = "#{@user_name}"
		att.phone = "#{@user_phone}"
		att.datestamp = "#{@user_date}"
		att.barber = "#{@user_selection}"
		att.color = "#{@color}"
	end

	if @cl.save
		erb "<h2> Спасибо, Вы записались!</h2>"	
	else
		@error = @cl.errors.full_messages.first
		erb :visit
	end
#  ----------------------------------------
	
end

get '/contact' do
	erb :contact
end

post '/contact' do
# ----ЗАПИСЬ КОНТАКТОВ (2 ВАРИАНТ (УРОК))----	
# ИЗМЕНИЛИ ИМЕНА В VIEW/contact.erb было 'contact_name' стало 'contact[name]'

	con = Contact.new params[:contact]

	con.save
# ----------------------------------------	

	erb "<h2> Спасибо, сообщение отправлено!</h2>"
end

get "/barber/:id" do
	@barber = Barber.find(params[:id])

	erb :barber
end	

get "/bookings" do
	@clients = Client.order('created_at DESC')

	erb :bookings
end

get "/client/:id" do
	@client = Client.find(params[:id])
	erb :client
end	