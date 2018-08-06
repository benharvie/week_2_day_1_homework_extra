class Library
  attr_accessor(:books)
  def initialize(books)
    @books = books
  end

  def books
    return @books
  end

  def get_all_info(title)
    @books.each { |book|
      if book[:title] == title
        return book
      end
    }
  end

  def get_rental_info(title)
    @books.each { |book|
      if book[:title] == title
        return book[:rental_details]
      end
    }
  end

  def add_book(title)
    @books.push({
    title: title,
    rental_details: {
     student_name: "",
     date: ""
    }
  })
  end

  def change_details(title, student, date)
    @books.each { |book|
      if book[:title] == title
        book[:rental_details][:student_name] = student
        book[:rental_details][:date] = date
      end
    }
  end
end
