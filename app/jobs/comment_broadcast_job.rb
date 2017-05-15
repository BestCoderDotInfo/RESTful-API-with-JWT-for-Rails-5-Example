class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    # Do something later
    ActionCable.server.broadcast 'room_channel', comment: render_comment(comment)
  end

  private
    def render_comment(comment)
      ApplicationController.renderer.render(partial: 'comments/comment', locals: { comment: comment })
    end
end
