class BooksController < ApplicationController
  def search
    @book_search_form = BookSearchForm.new
  end

  def index
    @book_search_form = BookSearchForm.new(params[:book_search_form])
    render :search and return unless @book_search_form.valid?
  end

  def search_ajax
    @book_search_form = BookSearchForm.new
  end

  def index_ajax
    @books = Book.search params[:book_search_form]
  end
end
