class Library
  attr_reader :name, :books, :authors, :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame(author)
    book_years = author.books.map do |book|
      book.publication_year.to_i
    end
    sorted_years = book_years.sort
    {start: sorted_years.first.to_s, end: sorted_years.last.to_s}
  end

  def checkout(book)
    return false unless @books.include?(book)
    return false if @checked_out_books.include?(book)
    @checked_out_books << book
  end

  def return(book)
    @checked_out_books.delete(book)
  end
end