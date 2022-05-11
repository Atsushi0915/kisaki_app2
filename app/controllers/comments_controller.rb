class CommentsController < ApplicationController
  def create
    @comments = @current_user.comments.new(comment_params)
    if @comments.save
      redirect_to post_show(@comment.post), notice:"コメントを追記しました。"
    else
      flash.alert = "コメントできませんでした。"
      p "==================-"
      redirect_to post_path(@comments.post), status: :unprocessable_entity
    end
  end

  def destroy

  end

  private
    def comment_params
      params.require(:comment).permit(:comment_text, :post_id)
    end
end
