class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:id])

      if @comment.save
        redirect_to @comment.post, remote: true, notice: 'Commentaire enregistré.'
      else
        redirect_to Post.find(params[:id]), error: "Le commentaire n'a pas été enregistré."

      end

  end


  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
