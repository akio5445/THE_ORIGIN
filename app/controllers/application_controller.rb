class ApplicationController < ActionController::Base

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers if Rails.env.production
  # エラーの表示をプロダクト環境のみ変更するモジュール
  # concerns/error_handlers参照views/errors参照
end