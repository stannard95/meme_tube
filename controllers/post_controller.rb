class PostsController < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), "..")

	set :views, Proc.new { File.join(root, 'views') }


  # creates new meme video and adds to database
	post '/posts' do
		new_meme = Post.new
		new_meme.title = params[:title]
		new_meme.description = params[:description]
		new_meme.url = params[:url]
		new_meme.genre = params[:genre]
		new_meme.save
		redirect "/posts"

	end

	# directs to 'make meme video' page

	get '/posts/new' do
		erb :"posts/new"
	end	

  # returns all the meme videos
	get '/posts' do
	@posts = Post.all
    erb :"posts/index"

	end

  # Edits values of the meme video
	put "/posts/:id" do
	  id = params[:id]
      meme = Post.find(params[:id])
      meme.title = params[:title]
	  meme.description = params[:description]
	  meme.url = params[:url]
	  meme.genre = params[:genre]
      meme.save

      redirect "/posts"
	
	end

 #  # directs to select meme video page
	# get '/posts/:id' do
	# 	@meme = Post.find(params[:id])
	# 	erb :"posts/show"
	  
	# end

	# directs to selected meme video page for editing
	get "/posts/:id/edit" do
		@meme = Post.find(params[:id])
  		erb :"posts/edit"
		
	end

 

  # deletes meme video
  delete "/posts/:id" do
  	id = params[:id]
    Post.destroy(id)
    redirect "/posts"
   
  end

end