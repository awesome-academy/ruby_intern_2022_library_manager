class Admin::PublishersController < ApplicationController
  layout "admin_application"

  before_action :authorize
  before_action :check_publisher, except: %i(new index create)

  def index
    @publishers = Publisher.all
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
    if @publisher.update publisher_params_with_address_id
      flash[:success] = t ".updated"
      redirect_to [:admin, @publisher]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @publisher.destroy
      flash[:success] = t ".deleted"
    else
      flash[:danger] = t ".fail_to_delete"
    end
    redirect_to admin_publishers_url
  end

  private

  def publisher_params
    params.require(:publisher)
          .permit(:name, :description, :contact,
                  address_attributes: [:street, :sub_district,
                                       :district, :city])
  end

  def publisher_params_with_address_id
    params.require(:publisher)
          .permit(:name, :description, :contact,
                  address_attributes: [:id, :street, :sub_district,
                                      :district, :city])
  end

  def authorize
    return if current_account&.is_librarian?

    flash[:danger] = t ".unauthorized"
    store_location
    redirect_to admin_login_url
  end

  def check_publisher
    @publisher = Publisher.find_by id: params[:id]
    return if @publisher

    flash[:danger] = t ".publisher_not_found", id: params[:id]
    redirect_to admin_publishers_url
  end
end
