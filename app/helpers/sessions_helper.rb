module SessionsHelper
  def log_in account
    session[:account_id] = account.id
  end

  def current_account
    return unless session[:account_id]

    @current_account ||= Account.find_by(id: session[:account_id])
  end

  def log_out
    session.delete :account_id
    @current_account = nil
  end

  def logged_in?
    current_account.present?
  end

  def store_location
    session[:forward_url] = request.original_url if request.get?
  end

  def redirect_back_or default
    redirect_to(session[:forward_url] || default)
    session.delete(:forward_url)
  end
end
