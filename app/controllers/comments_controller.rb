class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  helper_method :create_comment

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { }
      else
        format.js { }
      end
    end
  end

  def create_comment
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { }
      else
        format.js { }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
