class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new # It's Article.new so we can call articles.errors.any? in new.html.erb (otherwise we'll get an error)
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params) 

		if @article.save
			redirect_to @article
		else
			render 'new' # if the .save fails, e.g, when the title validations is false. We use render to pass the @article back to a new page.	
		end
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params) #not necessary to pass all the atributes, only the modified atributes.
			redirect_to @article
		else
			render 'edit' #if there is any error
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path #we don't need a view, because when we destroy an article we just redirect to the index action.
	end


	private
		def article_params
			params.require(:article).permit(:title, :text) #Strong parameters: only permits title and text in our model.
		end
end
