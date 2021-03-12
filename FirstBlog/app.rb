#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/reloader'

def init_db
	@db = SQLite3::Database.new 'blog.db'
	@db.results_as_hash = true
	return @db
end

# before запускается каэжый раз при post и get запросах
before do
	init_db
end

# configure вызывается каждый раз при конфигурации приложения,
# когда изменился код программы и перезагрузилась страница
configure do
	init_db

	@db.execute 'CREATE TABLE IF NOT EXISTS "Posts" 
	(
	 "id" INTEGER PRIMARY KEY AUTOINCREMENT,
	 "created_date" DATE,
	 "content" TEXT,
	 "author" TEXT
	)'

	@db.execute 'CREATE TABLE IF NOT EXISTS "Comments" 
	(
	 "id" INTEGER PRIMARY KEY AUTOINCREMENT,
	 "created_date" DATE,
	 "content" TEXT,
	 "post_id" INTEGER
	)'
end

get '/' do
	@results = @db.execute 'select * from Posts order by id desc'

	erb :index			
end

get '/new' do
	erb :new		
end

post '/new' do

	content = params[:content]
	author = params[:author]

	if author.length <= 0
		@error = 'Type name'
		return erb :new
	end	

	if content.length <= 0
		@error = 'Type text'
		return erb :new
	end	

	@db.execute "insert into Posts (
		created_date,
		author, 
		content
	) 
		values 
	(
	datetime(),
	'#{author}',
	'#{content}'
	)"

	redirect to '/'
end

get '/details/:post_id' do
	post_id = params[:post_id]

	results = @db.execute 'select * from Posts where id = ?', [post_id]
	@row = results [0]

	@comments = @db.execute 'select * from Comments where post_id = ? order by id desc', [post_id]

	erb :details
end

post '/details/:post_id' do
	post_id = params[:post_id]

	content = params[:content]

	@db.execute "insert into Comments 
	(
		created_date, 
		content, 
		post_id
	) 
		values 
	(
		datetime(),
		'#{content}', 
		'#{post_id}'
	)"

	redirect to ('/details/' + post_id)
end	