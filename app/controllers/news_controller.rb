class NewsController < ApplicationController

	def index

		@news = News.paginate(:page => params[:page], :per_page => 2).order('created_at DESC')
	end

	def show

		@news = News.find(params[:id])
	end

	def new

		@news= News.new 
	end

	def create
		@news = News.new(news_param)
		
		if @news.save
			redirect_to @news
		else 
			render 'new'
		end
	end

	def edit
		@news = News.find(params[:id])
	end

	def update
 		@news = News.find(params[:id])
 
  		if @news.update(news_param)
    		redirect_to @news
  		else
   			render 'edit'
 		end
	end

	def destroy
		@news = News.find(params[:id])
		@news.destroy

		redirect_to "/"
	end

	private
		def news_param
			params.require(:news).permit(:title,:text)
		end
end
