# frozen_string_literal: true

module Revolut
  # Custom utilities
  module Utils
    BLANK_RE = /\A[[:space:]]*\z/.freeze

    class << self
      def blank?(obj)
        return !!BLANK_RE.match(obj) if obj.is_a?(String)

        obj.respond_to?(:empty?) ? !!obj.empty? : !obj
      end

      def present?(obj)
        !blank?(obj)
      end

      def presence(obj)
        obj if present?(obj)
      end
    end
  end
end
