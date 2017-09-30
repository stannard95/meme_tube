class PostsController < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), "..")

	set :views, Proc.new { File.join(root, 'views') }


  # creates new meme video and adds to database
	post '/memes' do
	
	end

  # returns all the meme videos
	get '/memes' do

	end

  # directs to 'make meme video' page
	get '/memes/new' do
		
	end


  # directs to select meme video page
  get '/memes/:id' do
  
  end

	# directs to selected meme video page for editing
	get "/memes/:id/edit" do
		
	end

  # Edits values of the meme video
	put "/memes/:id" do
	
	end

  # deletes meme video
  delete "/memes/:id" do
   
  end

end