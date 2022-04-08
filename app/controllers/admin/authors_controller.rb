class Admin::AuthorsController < ApplicationController
  layout "admin_application"

  before_action :authorize
  before_action :check_author, except: %i(index new create)

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def show; end

  def create
    @author = Author.new author_params
    if @author.save
      redirect_to admin_author_url(@author)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @author.update author_params
      flash[:success] = t ".updated"
      redirect_to [:admin, @author]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find_by id: params[:id]
    if @author&.destroy
      flash[:success] = t ".deleted"
    else
      flash[:danger] = t ".forbidden"
    end
    redirect_to admin_authors_url
  end

  private

  def author_params
    params.require(:author)
          .permit(:name, :bio)
  end

  def authorize
    return if current_account&.is_librarian?

    flash[:danger] = t ".unauthorized"
    store_location
    redirect_to admin_login_url
  end

  def check_author
    @author = Author.find_by id: params[:id]
    return if @author

    flash[:danger] = t ".author_not_found", id: params[:id]
    redirect_to admin_authors_url
  end
end
