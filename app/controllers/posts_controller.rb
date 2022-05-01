class PostsController < ApplicationController
  before_action :set_post, only: [:update, :show, :edit, :destroy]
  before_action :not_login_user, only: [:new, :create, :update, :destroy, :show, :index, :edit]

  def top
  end

  def new
    @post = Post.new
  end

  def create
    @post = @current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "新規登録しました。"
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @post.del_flag = 1
    @post.save
    redirect_to @post, notice: "削除しました。"
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def index
    @post = @current_user.posts
  end

  def edit
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :post_image)
    end

    def set_post
      @post = @current_user.posts.find_by(id: params[:id])
    end
end
