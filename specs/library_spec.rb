require('minitest/autorun')
require('minitest/rg')
require_relative('../library.rb')

class LibraryTest < MiniTest::Test
  def setup
    books = [ {
      title: "lord_of_the_rings",
      rental_details: {
        student_name: "Jeff",
        date: "01/12/16"
      }
    },

    {
      title: "harry_potter",
      rental_details: {
        student_name: "Ben",
        date: "05/11/18"
      }
      } ]

      @library = Library.new(books)
      @book = {
        title: "a_series_of_unfortunate_events",
        rental_details: {
          student_name: "",
          date: ""
        }
      }
    end

    def test_get_book_by_title__all_details
      details = {:title=>"harry_potter", :rental_details=>{:student_name=>"Ben", :date=>"05/11/18"}}
      assert_equal(details, @library.get_all_info("harry_potter"))
    end

    def test_get_book_by_title__rental_details
      details = {:student_name=>"Ben", :date=>"05/11/18"}
      assert_equal(details, @library.get_rental_info("harry_potter"))
    end

    def test_add_book_to_library
      @library.add_book(@book)
      assert_equal(3, @library.books.count)
    end

    def test_change_book_rental_details
      expected = {
        title: "lord_of_the_rings",
        rental_details: {
          student_name: "Josh",
          date: "01/01/01"
        }
      }

      @library.change_details("lord_of_the_rings", "Josh", "01/01/01")
      assert_equal(expected, @library.get_all_info("lord_of_the_rings"))
    end
  end
