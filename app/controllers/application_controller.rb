class ApplicationController < ActionController::API
  def pagy_headers_merge
    {
      page: request.headers['PAGE'] || ENV['PAGE_PAGINATION'].to_i,
      limit: request.headers['LIMIT'] || ENV['LIMIT_PAGINATION'].to_i
   }
  end
end
