class BooksController < ApplicationController
  before_action :set_book, only: [:show]

  def search
    @book_search_form = BookSearchForm.new
  end

  def index
    @book_search_form = BookSearchForm.new(params[:book_search_form])

    @books = Book.search params[:book_search_form] if params[:csv]

    render :search and return unless @book_search_form.valid?
    send_data Book.to_csv(@books), type: 'text/csv; charset=shift_jis', filename: "books.csv" if params[:csv].present?
  end

  def search_ajax
    @book_search_form = BookSearchForm.new
  end

  def index_ajax
    @books = Book.search params[:book_search_form]
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: t('messages.created_book') }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :publisher, :isbn, :cover, :cover_cache, :remove_cover)
    end
end
