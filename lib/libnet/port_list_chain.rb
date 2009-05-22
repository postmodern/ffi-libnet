require 'ffi'

module FFI
  module Libnet
    class PortListChain < FFI::Struct

      layout :node, :uint16,
             :bport, :uint16,
             :eport, :uint16,
             :id, :uint8,
             :next, :pointer

    end
  end
end
