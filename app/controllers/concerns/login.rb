module Login
  extend ActiveSupport::Concern

  included do
    def new; end

    def destroy
      log_out
      redirect_to root_url
    end

    private
    def load_user
      @account = Account.find_by username: params[:session][:username]
      return if @account&.authenticate(params[:session][:password])

      flash.now[:danger] = t ".invalid_info"
      render :new, status: :unprocessable_entity
    end
  end
end
