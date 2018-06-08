class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_collection, only: [:index, :create, :update, :destroy]


  def index
    respond_to do |f|
      f.js { render :layout => false }
      f.html { redirect_to root_path }
    end
  end


  def show
    @comment = Comment.new
    respond_to do |f|
      f.js { render :layout => false }
    end
  end


  def new
    @post = Post.new
    respond_to do |f|
      f.js { render :layout => false }
    end
  end


  def edit
    respond_to do |f|
      f.js { render :layout => false }
    end
  end


  def create
    @post = Post.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.js { }
      else
        format.js { }
      end
    end
  end


  def update
    respond_to do |format|
      if @post.update(post_params)
        format.js { }
      else
        format.js { }
      end
    end
  end


  def destroy
    @post.destroy
    respond_to do |format|
      format.js { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_collection
      @posts = Post.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :content)
    end
end
