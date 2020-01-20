class ApplicationController < ActionController::Base
  rescue_from StandardError, with: :rescue500

  private def rescue500
    render "errors/internal_server_error", status: 500
  end
end