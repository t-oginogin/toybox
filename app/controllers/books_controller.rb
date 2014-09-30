class BooksController < ApplicationController
  def search
    @book_search_form = BookSearchForm.new
  end

  def index
    @book_search_form = BookSearchForm.new(params[:book_search_form])
    render :search and return unless @book_search_form.valid?
  end
end
