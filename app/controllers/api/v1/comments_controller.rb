class Api::V1::CommentsController < ApiController
  def create
    comment = @current_user.comments.create(comment_params)
    if comment.save
      json_response(comment)
    else
      json_response({message: comment.errors.full_messages})
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :chat_room_id)
  end
end
