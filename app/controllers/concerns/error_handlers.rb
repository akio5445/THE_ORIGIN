module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :rescue500
    rescue_from ApplicationController::Forbidden, with: :rescue403
    rescue_from ApplicationController::IpAddressRejected, with: :rescue403
    rescue_from ActionController::ParameterMissing, with: :rescue400
  end
  # 継承関係上上記の順番を変えてはいけない
  # ActionController::ActionControllerError < StandardError < Exception

  private def rescue400(e)
    render "errors/bad_request", status: 400
    # 400はクライアントからのリクエストが正しくない時
  end

  private def rescue403(e)
    @exception = e
    render "errors/forbidden", status: 403
    # 403は要求されらリソースがwebサイトに存在するがなんらかの理由でアクセス拒否された時
  end

  private def rescue500(e)
    render "errors/internal_server_error", status: 500
    #　500は何らかのエラーが発生してる時
  end
end
