module Admin
  class AdminPageController < ApplicationController
    layout "admin_application"

    before_action :check_librarian

    def home; end

    private

    def check_librarian
      return if current_account&.is_librarian?

      flash[:danger] = t ".not_librarian"
      redirect_to admin_login_url
    end
  end
end
