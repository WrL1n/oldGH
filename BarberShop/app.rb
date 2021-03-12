require 'rubygems'
require 'sinatra'
require 'sqlite3'

def get_db
	db = SQLite3::Database.new 'barbershop.db'
	db.results_as_hash = true
	return db
end

before do
	@showbarbers={}
	db = get_db
	@showbarbers = db.execute 'select*from Barbers'
end	

# def is_barber_exists? db,name
# 	db.execute ('select * from Barbers where name=?', [name]).lenght > 0
# end

# def seed_db db, barbers
# 	barbers.each do |barber|
# 		if !is_barber_exists? db, barbers
# 			db.execute 'insert into Barbers (name) values (?)', [barber]
# 		end	
# end

configure do
	db = get_db
	db.execute 'CREATE TABLE IF NOT EXISTS
		"Users" 
		(
			"id" INTEGER PRIMARY KEY AUTOINCREMENT, 
			"user_name" TEXT, 
			"user_date" TEXT, 
			"user_phone" TEXT, 
			"user_selection" TEXT, 
			"color" TEXT
		)'

	# --------ОШибка ( возможно в геме)--------
	# db.execute 'CREATE TABLE IF NOT EXISTS
	# 	"Barbers" 
	# 	(
	# 		"id" INTEGER PRIMARY KEY AUTOINCREMENT, 
	# 		"barber" TEXT UNIQUE, 
	# 	)'

	# ---------Добавление парикхмахеров в БД (Мой вариант)------
	# db.execute 'INSERT OR REPLACE INTO
	# 	Barbers(barber) VALUES("Jessie Pinkman")'

	# db.execute 'INSERT OR REPLACE INTO
	# 	Barbers(barber) VALUES("Walter White")'

	# db.execute 'INSERT OR REPLACE INTO
	# 	Barbers(barber) VALUES("Gus Fring")'							
end	

get '/' do
	erb "MrLin`s BarberShop"			
end

get '/about' do
	erb :about
end

get '/visit' do
	@showbarbers={}
	db = get_db
	@showbarbers = db.execute 'select*from Barbers'

	erb :visit
end

post '/visit' do

	@user_name = params[:user_name]
	@user_date = params[:user_date]
	@user_phone = params[:user_phone]
	@user_selection = params[:user_selection]
	@color = params[:color]

	db = get_db
	db.execute 'insert into 
	Users 
	(
		user_name, 
		user_date, 
		user_phone, 
		user_selection, 
		color
	)
	values (?, ?, ?, ?, ?)', [@user_name, @user_date, @user_phone, @user_selection, @color]

	#----- Сохранение в файл------
	#f = File.open './public/users.txt',"a"
	#f.write "Name: #{@user_name},Date: #{@user_date}, Phone #{@user_phone}, Selection: #{@user_selection}, Color: #{@color}" 
	#f.close

	#--------------Вариант урока---------
	# хеш
	#hh = { 	:username => 'Введите имя',
	#		:phone => 'Введите телефон',
	#		:datetime => 'Введите дату и время' }
	#@error = hh.select {|key,_| params[key] == ""}.values.join(", ")
	#if @error != ''
	#	return erb :visit
	#end
	#erb "OK, username is #{@username}, #{@phone}, #{@datetime}, #{@barber}, #{@color}"


	erb '<h2> Спасибо, Вы записались </h2>'
	# erb "OK, Name: #{@user_name},Date: #{@user_date}, Phone #{@user_phone}, Selection: #{@user_selection}, Color: #{@color}"

end

get '/contacts' do
	erb :contacts		
end

post '/contacts' do
	require 'pony'
    Pony.mail(
    :name => params[:contacts_name],
    :mail => params[:contacts_email],
    :body => params[:contacts_text],
    :to => 'mrlinad23@yandex.ru',
    :subject => params[:contacts_name] + " has contacted you",
    :body => params[:contacts_text],
    :port => '587',
    :via => :smtp,
    :via_options => { 
    :address              => 'smtp.gmail.com', 
    :port                 => '587', 
    :enable_starttls_auto => true, 
    :user_name            => 'lumbee', 
    :password             => 'p@55w0rd', 
    :authentication       => :plain, 
    :domain               => 'localhost.localdomain'
	  })

	#redirect '/success' 
	erb "Сообщение отправлено"

	#----------------Мой вариант с сохранением в файл-------------
	#@contacts_email=params[:contacts_email]
	#@contacts_text=params[:contacts_text]

	#f = File.open './public/contacts.txt',"a"
	#f.write "Email: #{@contacts_email}, Text: #{@contacts_text}" 
	#f.close

	#erb "Сообщение отправлено"
end	

get '/admin' do
	erb :admin	
end

post '/admin' do
	@login=params[:login]
	@password=params[:password]
	@results={}

	if @login != 'admin' and @password != 'Secret'
		erb 'Error Login/Password'
	else
		db = get_db

		@results = db.execute 'select*from Users order by id desc '

		erb :showusers	
	end	
end	

# get '/showusers' do
# 	erb :showusers	
# end

# post '/showusers' do
# 	erb :showusers
# end


