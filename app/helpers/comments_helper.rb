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

        render_to_string partial: 'comments/comment', layout: false, locals: { comment: @comment,
                                   children: @options[:children] }
      end

    end
  end
end
