class Api::V1::UsersController < ApiController
  include Pagination

  def index
    @users = paginate(User.all, params[:page], 10)
    json_response(@users)
  end
end
