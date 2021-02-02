class PostsController < ApplicationController
    # before_action :set_post, only: %i[ show edit update destroy ]
    # before_action :authenticate_user!, except: [:index, :show]  

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
    
        respond_to do |format|
          if @post.save
            format.html { redirect_to root_path, notice: 'Post was successfully created.' }
            format.json { render :show, status: :created, location: @post }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end


    # def create
    #     #@post = Post.new(posts_params)
    #     @post = Post.new(:title => params[:title], :body => params[:body]) 
    #     if @post.save
    #     redirect_to new_post_path
    #     else
    #     render :new
    #     end 
    # end

    private

    def post_params
        params.require(:post).permit(:body, :title)
    end 

end
