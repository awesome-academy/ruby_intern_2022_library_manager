module BookItemsHelper
  def to_item_status_badge book_item
    return "success" if book_item.nice?

    return "danger" if book_item.damaged?

    "info"
  end
end
