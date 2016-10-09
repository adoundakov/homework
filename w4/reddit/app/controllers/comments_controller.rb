class CommentsController < ApplicationController
  def new
    render :new
  end

  def update
    comment = Comment.find(params[:id])

    if comment.update_attributes(comment_params)
      redirect_to post_url(comment.post_id)
    else
      # errors
      render :edit
    end
  end

  def create
    comment = Comment.new(comment_params)
    comment.author_id = current_user.id
    comment.post_id = params[:post_id]
    comment.parent_comment_id = params[:comment_id]

    if comment.save
      redirect_to post_url(comment.post_id)
    else
      render :new
    end
  end

  def destroy
    comment = Comment.find(params[:id])

    if comment.destroy
      redirect_to post_url(comment.post_id)
    else
      # errors
      redirect_to post_url(comment.post_id)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    render :edit
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id)
  end
end
