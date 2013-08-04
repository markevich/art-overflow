# coding: UTF-8
# DOC:
# We use Helper Methods for tree building,
# because it's faster than View Templates and Partials

# SECURITY note
# Prepare your data on server side for rendering
# or use h.html_escape(node.content)
# for escape potentially dangerous content
module CommentsHelper
  module Render 
    class << self
      attr_accessor :h, :options

      delegate :t, :render_to_string, to: :controller

      # Main Helpers
      def controller
        @options[:controller]
      end

      def moderator?
        controller.try(:current_user).try(:comment_moderator?, @comment)
      end

      # Render Methods
      def render_node(h, options)
        @h, @options = h, options
        @comment     = options[:node]

        @max_reply_depth = options[:max_reply_depth] || TheComments.config.max_reply_depth

        published_comment
      end

      def published_comment
        like_btn = if @options[:controller].user_signed_in?
          if @options[:controller].current_user.voted_on?(@comment)
            h.button_to(t('the_comments.unlike'), action: 'unlike', controller: 'comments', id: @comment.id)
          else
            h.button_to(t('the_comments.like'), action: 'like', controller: 'comments', id: @comment.id)
          end
        end
        likes = @comment.likes_count
        render_to_string partial: 'comments/comment', layout: false, locals: { comment: @comment,
                                   likes: likes, like_button: like_btn,
                                   children: @options[:children] }
      end

    end
  end
end
