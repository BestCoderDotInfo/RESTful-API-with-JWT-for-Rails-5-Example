class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast 'room_channel', comment: render_comment(comment), room: comment.chat_room_id, receive_user: ChatRoomMember.where(chat_room_id: comment.chat_room_id).where.not(user_id: comment.user_id).first.try(:user_id), sender_user: comment.user_id
  end

  private
    def render_comment(comment)
      ApplicationController.renderer.render(partial: 'comments/comment', locals: { comment: comment })
    end
end
