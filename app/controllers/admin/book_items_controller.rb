class Admin::BookItemsController < ApplicationController
  layout "admin_application"

  before_action :authorize
  before_action :get_book
  before_action :get_book_item, except: %i(index new create)
  before_action :get_rack_location, only: %i(create update)

  def index
    @book_items = @book.book_items
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
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy; end

  private

  def get_book
    @book = Book.find_by id: params[:book_id]
    return if @book

    flash[:danger] = t ".not_found"
    redirect_to admin_book_book_items_url
  end

  def get_book_item
    @book_item = BookItem.find_by id: params[:id]
    return if @book_item

    flash[:danger] = t ".item_not_found"
    redirect_to admin_book_book_items_url
  end

  def authorize
    return if current_account&.is_librarian?

    flash[:danger] = t ".unauthorized"
    store_location
    redirect_to admin_login_url
  end

  def book_item_params
    params.require(:book_item)
          .permit(:book_id, :bar_code, :is_reference_only,
                  :price, :status, :format,
                  :date_of_purchase)
  end

  def get_rack_location
    @rack_location =
      RackLocation.find_by id: params.dig(:book_item, :rack_location_id)
    return if @rack_location

    flash[:danger] = t ".rack_not_found"
    redirect_to admin_book_book_items_url
  end
end
