class Admin::BookItemsController < Admin::AdminBaseController
  before_action :load_pagy_locale, only: :index
  before_action :load_book
  before_action :load_book_item, except: %i(index new create)
  before_action :load_rack_location, only: %i(create update)

  def index
    @pagy, @book_items = pagy @book.book_items
  end

  def new
    @book_item = @book.book_items.build
  end

  def create
    @book_item = @book.book_items.build book_item_params
    @book_item.rack_location = @rack_location
    if @book_item.save
      flash[:success] = t ".created"
      redirect_to [:admin, @book, @book_item]
    else
      flash[:danger] = t ".form_errors"
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    @book_item.rack_location = @rack_location
    if @book_item.update book_item_params
      flash[:success] = t ".updated"
      redirect_to [:admin, @book, @book_item]
    else
      flash[:danger] = t ".form_errors"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy; end

  private
  def load_book
    @book = Book.find params[:book_id]
  end

  def load_book_item
    @book_item = BookItem.find params[:id]
  end

  def book_item_params
    params.require(:book_item).permit(BookItem::CREATABLE_ATTRS)
  end

  def load_rack_location
    @rack_location =
      RackLocation.find params.dig(:book_item, :rack_location_id)
  end
end
