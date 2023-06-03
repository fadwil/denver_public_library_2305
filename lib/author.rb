class Author
  attr_reader :name, :books

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @name = "#{@first_name} #{@last_name}"
    @books = []
  end

  def write(title, publication_year)
    new_books = Book.new({
      title: title,
      author_first_name: @first_name,
      author_last_name: @last_name,
      publication_date: publication_year
    })
    @books << new_books
    new_books
  end
end