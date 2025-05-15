class ApplicationController < ActionController::API
  def pagy_headers_merge
    {
      page: params[:page] || ENV['PAGE_PAGINATION'].to_i,
      limit: params[:limit] || ENV['LIMIT_PAGINATION'].to_i
   }
  end
end
