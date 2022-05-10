class CommentsController < ApplicationController
  def create
    @comment = @current_user.comments.new(comment_params)
    if @comment.save
      redirect_to @post, notice:"コメントを追記しました。"
    else
      flash.alert = "コメントできませんでした。"
      render('posts/show')
    end
  end

  def destroy

  end

  private
    def comment_params
      params.require(:comment).permit(:comment_text, :post_id)
    end
end
