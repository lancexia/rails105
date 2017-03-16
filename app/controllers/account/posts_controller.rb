class Account::PostsController < ApplicationController
  before_action :authenticate_user!


  def index
    @posts = current_user.posts
  end

  def edit
      @group = Group.find(params[:group_id])
      @post = Post.find(params[:id])
      @post.group = @group
    end

    def update
      @group = Group.find(params[:group_id])
      @post = Post.find(params[:id])
      @post.group = @group
      @post.user = current_user

      if @post.update(post_params)
    redirect_to account_posts_path, notice: "編輯成功"
  else
    render :edit
  end
    end

    def destroy
      @group = Group.find(params[:group_id])
      @post = Post.find(params[:id])
      @post.group = @group
      @post.destroy
      flash[:alert] = "Post deleted"
      redirect_to account_posts_path
    end

end
