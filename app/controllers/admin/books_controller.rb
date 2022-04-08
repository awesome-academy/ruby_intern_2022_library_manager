class Admin::BooksController < ApplicationController
  layout "admin_application"

  before_action :authorize
  before_action :load_book, except: %i(index new create)

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def show; end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t ".created"
      redirect_to [:admin, @book]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @book.update book_params
      flash[:success] = t ".updated", title: @book.title
      redirect_to [:admin, @book]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = t ".deleted", title: @book.title
    else
      flash[:danger] = t "fail_to_delete", title: @book.title
    end
    redirect_to admin_books_url
  end

  private
  def book_params
    params.require(:book)
          .permit(:isbn, :title, :language, :number_of_pages,
                  :publication_date, :subject, :image_url,
                  author_ids: [], publisher_ids: [])
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book

    flash[:danger] = t ".book_not_found"
    redirect_to admin_books_url
  end

  def authorize
    return if current_account&.is_librarian?

    flash[:danger] = t ".unauthorized"
    store_location
    redirect_to admin_login_url
  end
end
