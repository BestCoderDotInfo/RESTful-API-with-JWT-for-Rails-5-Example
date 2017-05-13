module Pagination

  def paginate(collection, page_number, n = 15)
    collection.paginate(page: page_number, per_page: n)
  end

end
