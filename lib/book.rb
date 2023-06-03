class Book
  attr_reader :title, :author, :publication_year
  
  def initialize(info)
    @title = info[:title]
    @author_first_name = info[:author_first_name] 
    @author_last_name = info[:author_last_name]
    @author = "#{@author_first_name} #{@author_last_name}"
    @publication_year = info[:publication_date].split.last
  end
end 