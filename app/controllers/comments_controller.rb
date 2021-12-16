class CommentsController < ApplicationController
  def new
  end

  def create
  	id_article = params[:article_id]
  	user_id = session[:user_id]
  	@article = Article.find(id_article)
  	@comment = @article.comments.create!(:comments => params[:comment], :mate_id=> user_id)
  	redirect_to articles_path
  end

  def destroy
  end
end
