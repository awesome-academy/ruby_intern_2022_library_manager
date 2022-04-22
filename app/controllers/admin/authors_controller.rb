class Admin::AuthorsController < Admin::AdminBaseController
  before_action :load_pagy_locale, only: :index
  before_action :check_author, except: %i(index new create)

  def index
    @pagy, @authors = pagy Author.ordered_by_name
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
    begin
      if @author.destroy
        flash[:success] = t ".deleted"
      else
        flash[:danger] = t ".forbidden"
      end
    rescue ActiveRecord::DeleteRestrictionError
      flash[:danger] = t ".has_books"
    end
    redirect_to admin_authors_url
  end

  private

  def author_params
    params.require(:author)
          .permit(:name, :bio)
  end

  def check_author
    @author = Author.find_by id: params[:id]
    return if @author

    flash[:danger] = t ".author_not_found", id: params[:id]
    redirect_to admin_authors_url
  end
end
