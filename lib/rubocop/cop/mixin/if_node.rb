# encoding: utf-8

module Rubocop
  module Cop
    # Common functionality for checking if nodes.
    module IfNode
      def modifier_if?(node)
        node.loc.end.nil?
      end

      def ternary_op?(node)
        node.loc.respond_to?(:question)
      end

      def elsif?(node)
        node.loc.respond_to?(:keyword) && node.loc.keyword &&
          node.loc.keyword.is?('elsif')
      end

      def if_else?(node)
        node.loc.respond_to?(:else) && node.loc.else
      end

      def conditional_location(conditional_node)
        node = if conditional_node.type == :match_current_line
                 conditional_node.children.first
               else
                 conditional_node
               end

        node.loc
      end
    end
  end
end
