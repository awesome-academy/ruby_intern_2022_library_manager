module Admin
  class AdminBaseController < ApplicationController
    include Authorizable
    include Paginable
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_errors

    layout "admin_application"

    before_action :authorize_librarian

    private
    def not_found_errors
      flash[:danger] = t ".record_not_found"
      redirect_to admin_url
    end
  end
end
