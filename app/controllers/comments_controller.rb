class CommentsController < ApplicationController

	def create 
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params) #it will create and save comments for this particular article

		redirect_to article_path(@article) #Onde the commenter made its comment redirect to the articles' page.
	end

	def destroy 
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private 
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
