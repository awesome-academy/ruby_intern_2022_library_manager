class Admin::PublishersController < Admin::AdminBaseController
  before_action :load_pagy_locale, only: :index
  before_action :check_publisher, except: %i(new index create)

  def index
    @pagy, @publishers = pagy Publisher.ordered_by_name
  end

  def show; end

  def new
    @publisher = Publisher.new
    @publisher.build_address
  end

  def create
    @publisher = Publisher.new publisher_params
    if @publisher.save
      flash.now[:success] = t ".created"
      redirect_to [:admin, @publisher]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @publisher.update publisher_params
      flash[:success] = t ".updated"
      redirect_to [:admin, @publisher]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      if @publisher.destroy
        flash[:success] = t ".deleted"
      else
        flash[:danger] = t ".fail_to_delete"
      end
    rescue ActiveRecord::DeleteRestrictionError
      flash[:danger] = t ".has_books"
    end
    redirect_to admin_publishers_url
  end

  private

  def publisher_params
    params.require(:publisher).permit(Publisher::CREATABLE_ATTRS)
  end

  def check_publisher
    @publisher = Publisher.find id: params[:id]
  end
end
