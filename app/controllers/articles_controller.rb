class ArticlesController < ApplicationController

	#CREATE 1/2
	def new

	end
	
	#CREATE 2/2
	def create
		p=params.require(:article).permit(:title, :release_date, :text, :author)
		Article.create(p)
		redirect_to articles_path
	end

	#READ ALL
	def index
		@all = Article.all
	end

	#READ RESOURCE
	def show
		id = params[:id]
		if Article.exists?(id)
			@article = Article.find(id)
		else
			render html: 'Article does not exists'
		end
	end

	#UPDATE 1/2
	def edit 
		@article = Article.find(params[:id])
	end

	#UPDATE 2/2
	def update 
		Article.find(params[:id]).update(params[:article].permit(:title, :release_date, :text, :author))
		redirect_to articles_path
	end

	#DELETE
	def destroy
		Article.find(params[:id]).destroy
		redirect_to articles_path
	end
	
	#SEARCH
	def search
		if params[:search].blank?
			redirect_to articles_path and return
		else
			@parameter = params[:search].downcase
			@results = Article.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
		end
	end
	
		
end
