class SessionsController < ApplicationController
  include Login

  before_action :load_user, only: :create

  def create
    if @account.is_member?
      log_in @account
      redirect_to root_url
    else
      flash.now[:danger] = t ".not_member"
      render :new, status: :unprocessable_entity
    end
  end
end
