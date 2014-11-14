require 'csv'

class Book < ActiveRecord::Base
  mount_uploader :cover, CoverUploader

  class << self
    def search( search_params )
      books = Book.all
      books = search_title(search_params, books) if search_params[:title].present?
      books = search_author(search_params, books) if search_params[:author].present?
      books = search_publisher(search_params, books) if search_params[:publisher].present?

      books = search_isbn(search_params, books) if search_params[:isbn].present?
      books
    end

    def search_title( search_params, books )
      books = books.where("title LIKE ?", "%#{escape_like search_params[:title]}%")
    end

    def search_author( search_params, books )
      books = books.where("author LIKE ?", "%#{escape_like search_params[:author]}%")
    end

    def search_publisher( search_params, books )
      books = books.where("publisher LIKE ?", "%#{escape_like search_params[:publisher]}%")
    end

    def search_isbn( search_params, books )
      books = books.where("isbn LIKE ?", "%#{escape_like search_params[:isbn]}%")
    end

    def to_csv( books )
      headers = %w(id title auther publisher isbn cover)  
      contents = CSV.generate(headers: headers, write_headers: true, force_quotes: false) do |csv|
        books.each do |row|
          csv << [row.id, row.title, row.author, row.publisher, row.isbn, row.cover]
        end
      end
      contents.encode(Encoding::SJIS)
    end
  end
end
