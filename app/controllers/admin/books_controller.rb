class Admin::BooksController < Admin::AdminBaseController
  before_action :load_pagy_locale, only: :index
  before_action :load_book, except: %i(index new create)

  def index
    @pagy, @books = pagy Book.ordered_by_name
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
    begin
      if @book.destroy
        flash[:success] = t ".deleted", title: @book.title
      else
        flash[:danger] = t "fail_to_delete", title: @book.title
      end
    rescue ActiveRecord::DeleteRestrictionError
      flash[:danger] = t ".exist"
    end
    redirect_to admin_books_url
  end

  private

  def book_params
    params.require(:book).permit(Book::CREATABLE_ATTRS)
  end

  def load_book
    @book = Book.find params[:id]
  end
end
