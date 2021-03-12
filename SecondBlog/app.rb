#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:secondblog.db"

class Post < ActiveRecord::Base 
	validates :post_topic, presence: true, length: { minimum: 3 }
	validates :post_text, presence: true, length: { minimum: 5, maximum: 500} 
	validates :post_author, presence: true, length: { minimum: 3 }

	has_many :comments, dependent: :destroy
end	

class Comment < ActiveRecord::Base 
	validates :comment_text, presence: true, length: { minimum: 3, maximum: 200 }
	validates :comment_author, presence: true, length: { minimum: 3} 
	validates :post_id, presence: true

	belongs_to :post
end

before do
	@all_posts = Post.all.order('created_at DESC')
end

get '/' do
	erb :index			
end

get '/new' do
	erb :new			
end

post '/new' do
	posts = Post.new params[:post]

	posts.save

	erb "<h2> Successfully created post </h2>"		
end

get "/post/:id" do
	@post_id = Post.find(params[:id])
	@all_comments = Comment.where(post_id: @post_id.id)

	erb :post
end	

post "/post/:id" do
	@post_id = Post.find(params[:id])	

	com = @post_id.comments.new params[:comment]
	com.save
	
	redirect to ('/post/' + "#{@post_id.id}")
end
