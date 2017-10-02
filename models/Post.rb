 require 'pg'

class Post

	attr_accessor :id, :title, :description, :url, :genre

	def self.open_connection
		PGconn.connect( dbname: "meme_tube" )
	end

	#index

	def self.all
		conn = self.open_connection
		sql = "SELECT * FROM post;"
		results = conn.exec(sql)
		posts = results.map do |record|
			self.hydrate(record)
		end
		posts
	end

	def self.hydrate post_data
		post = Post.new
		post.id = post_data['id']
		post.title = post_data['title']
		post.description = post_data['description']
		post.url = post_data['url']
		post.genre = post_data['genre']
		post
	end

	#show

	def self.find id
		conn = self.open_connection
		sql = "SELECT * FROM post WHERE id = #{id}"
		posts = conn.exec(sql)
		post = self.hydrate(posts[0])
		post
	end

#create
	
	def save
		conn = Post.open_connection
		if (!self.id)
			sql = "INSERT INTO post (title, description, url, genre) VALUES ('#{self.title}', '#{self.description}', 
			'#{self.url}', '#{self.genre}')"
		else
			sql = "UPDATE post SET title = '#{self.title}', description = '#{self.description}',
			url = '#{self.url}', genre = '#{self.genre}' WHERE id = #{self.id}"
			
		end

		conn.exec(sql)
	end

#update

#delete
	def self.destroy id
		conn = self.open_connection
		sql = "DELETE FROM post WHERE id = #{id}"
		conn.exec(sql)

	end
end




