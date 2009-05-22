require 'libnet/context'

require 'ffi'

module FFI
  module Libnet
    class ContextQueue < FFI::Struct

      layout :context, :pointer,
             :next, :pointer,
             :prev, :pointer

      def context
        Context.new(self[:context])
      end

      def next
        ContextQueue.new(self[:next])
      end

      def prev
        ContextQueue.new(self[:prev])
      end

    end
  end
end
