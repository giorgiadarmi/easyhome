class CommentsController < ApplicationController
  def user_comments
    @user = User.find(params[:id])
 end

  def edit
    @comment = Article.find(params[:article_id]).comments.find(params[:id])
  end

  def update
    @comment=Article.find(params[:article_id]).comments.find(params[:id])
    
    if @comment.update(comment_params)
      redirect_to @comment.article
    else
      render :edit
    end
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to articles_path(@artile)
  end

  private
  def comment_params
      p = params.require(:comment).permit(:body, :user)
      {:body=> p[:body], :user=>current_user}
  end

end
