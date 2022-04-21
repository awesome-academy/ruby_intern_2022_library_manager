module Paginable
  extend ActiveSupport::Concern

  included do
    def load_pagy_locale
      @pagy_locale = params[:locale]
    end
  end
end
