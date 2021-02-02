class PostsController < ApplicationController
    before_action :set_post, only: %i[ show edit update destroy ]
    before_action :authenticate_user!, except: [:index, :show]  

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end
end
