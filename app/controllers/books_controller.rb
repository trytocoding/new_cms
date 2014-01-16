class BooksController < ApplicationController

	def index
		@books = Book.paginate(:page => params[:page], :per_page => 1)
	end

	def show
		@book = Book.find(params[:id])
	end

	def new
		@book= Book.new 
	end

	def create
		@book = Book.new(book_param)
		
		if @book.save
			redirect_to @book
		else 
			render 'new'
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
 		@book = Book.find(params[:id])
 
  		if @book.update(book_param)
    		redirect_to @book
  		else
   			render 'edit'
 		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy

		redirect_to books_path
	end

	private
		def book_param
			params.require(:book).permit(:title,:text,:year)
		end
end
