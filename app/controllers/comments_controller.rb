class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    @comment.save
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id]).destroy
    # コメントのIDを取得しないといけないのに、投稿postのIDを朱徳してしまっている
    redirect_to post_path(@post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
