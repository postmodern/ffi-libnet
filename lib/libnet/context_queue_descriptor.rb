require 'libnet/context_queue'

require 'ffi'

module FFI
  module Libnet
    class ContextQueueDescriptor < FFI::Struct

      layout :node, :uint32,
             :cq_lock, :uint32,
             :current, :pointer

      def current
        ContextQueue.new(self[:current])
      end

    end
  end
end
