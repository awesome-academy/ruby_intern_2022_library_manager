module Admin
  class AdminBaseController < ApplicationController
    include Authorizable
    include Paginable

    layout "admin_application"

    before_action :authorize_librarian
  end
end
