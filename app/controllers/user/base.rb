class User::Base < ApplicationController
  # if sessionで保持しているデーターに:user_member_idキーがあればその値で検索する
  # @current_user_memberがnilかfalseの時右辺を評価する
  private def current_user_member
    if session[:user_member_id]
      @current_user_member ||= UserMember.find_by(id: session[:user_member_id])
    end
  end

  #　current_user_memberメソッドを定義
  helper_method :current_user_member
end
