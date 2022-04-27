module BooksHelper
  def book_status_i18n book
    if book.on_demand?
      t ".on_demand"
    elsif book.suspension?
      t ".suspension"
    else
      t ".comming_soon"
    end
  end
end
