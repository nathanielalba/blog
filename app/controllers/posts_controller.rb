class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			flash[:success] = "Post was created successfully"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def update
		@post = Post.find(params[:id])

		if @post.update_attributes(post_params)
			flash[:success] = "Post was updated"
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:notice] = "Post was successfully deleted!"
		redirect_to root_url
	end

	private

		def post_params
			params.require(:post).permit(:title, :body)
		end
end
