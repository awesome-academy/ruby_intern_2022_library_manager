module Admin
  class SessionsController < ApplicationController
    include Login

    before_action :load_user, only: :create

    def create
      if @account.is_librarian?
        log_in @account
        redirect_back_or admin_url
      else
        flash.now[:danger] = t ".not_librarian"
        render :new, status: :unprocessable_entity
      end
    end
  end
end
