module Authorizable
  extend ActiveSupport::Concern

  included do
    def authorize_librarian
      return if current_account&.is_librarian?

      go_to_login admin_login_url
    end

    private

    def go_to_login login_url
      flash[:danger] = t ".unauthorized"
      store_location
      redirect_to login_url
    end
  end
end
