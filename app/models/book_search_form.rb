class BookSearchForm
  include ActiveModel::Model
  attr_accessor :title
  attr_accessor :author
  attr_accessor :publisher
  attr_accessor :isbn
  validates :title, length: { maximum: 20 }
  validates :author, length: { maximum: 20 }
  validates :publisher, length: { maximum: 20 }
end
