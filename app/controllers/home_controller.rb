class HomeController < ApplicationController
  before_action :prepare_comments
  before_action :authenticate_user!

  def index
    @rooms = ChatRoom.all
    @users = User.where(user_type: 'human').where.not(id: current_user.id)
  end

  private
    def prepare_comments
      @comments = Comment.last(5)
    end
end
