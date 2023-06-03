require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  it 'exists and has attributes' do
    dpl = Library.new("Denver Public Library")

    expect(dpl).to be_a Library
    expect(dpl.name).to eq "Denver Public Library"
  end

  it 'starts with no books' do
    dpl = Library.new("Denver Public Library")

    expect(dpl.books).to eq []
  end

  it 'starts with no authors' do
    dpl = Library.new("Denver Public Library")

    expect(dpl.authors).to eq []
  end

  it 'can add authors and books' do
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847") 
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.authors).to eq [charlotte_bronte, harper_lee]

    expect(dpl.books).to eq [jane_eyre, professor, villette, mockingbird]
  end

  it 'can show the publication time frame of an author' do
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847") 
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    expect(dpl.publication_time_frame(charlotte_bronte)).to eq({start: "1847", end: "1857"})
  end

  it 'can checkout a book if it exists and has not been checked out' do
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847") 
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")


    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    dpl.checkout(jane_eyre)

    expect(dpl.checked_out_books).to eq([jane_eyre])
    expect(dpl.checkout(jane_eyre)).to eq false

    tom_saywer = nil
    expect(dpl.checkout(tom_saywer)).to eq false
  end

  it 'can return a book' do
    dpl = Library.new("Denver Public Library")

    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    
    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847") 
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_author(charlotte_bronte)
    dpl.add_author(harper_lee)

    dpl.checkout(jane_eyre)

    expect(dpl.checked_out_books).to eq([jane_eyre])

    dpl.return(jane_eyre)

    expect(dpl.checked_out_books).to eq([])
  end
end