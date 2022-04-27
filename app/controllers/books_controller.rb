class BooksController < ApplicationController
  include Paginable

  before_action :load_pagy_locale

  def index
    @pagy, @books = pagy Book.ordered_by_name
  end
end
