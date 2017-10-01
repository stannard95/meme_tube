class PostsController < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), "..")

	set :views, Proc.new { File.join(root, 'views') }


  # creates new meme video and adds to database
	post '/memes' do
		new_meme = Post.new
		new_meme.title = params[:title]
		new_meme.description = params[:description]
		new_meme.url = params[:url]
		new_meme.genre = param[:genre]
		new_meme.save
		redirect "/memes"

	end

  # returns all the meme videos
	get '/memes' do
	@posts = Post.all
    erb :"posts/index"

	end

  # directs to 'make meme video' page
	get '/memes/new' do
		erb :"memes/new"
		
	end


  # directs to select meme video page
	get '/memes/:id' do
		@post = Post.find(params[:id])
		erb :"memes/show"
	  
	end

	# directs to selected meme video page for editing
	get "/memes/:id/edit" do
		@post = Post.find(params[:id])
  		erb :"memes/edit"
		
	end

  # Edits values of the meme video
	put "/memes/:id" do
	  id = params[:id]
      meme = Post.find(params[:id])
      meme.title = params[:title]
	  meme.description = params[:description]
	  meme.url = params[:url]
	  meme.genre = param[:genre]
      post.save

      redirect "/memes/#{meme.id}"
	
	end

  # deletes meme video
  delete "/memes/:id" do
  	id=params[:id]
    Post.destroy(id)
    redirect "/memes"
   
  end

end