require 'ffi'

module FFI
  module Libnet
    class EtherAddr < FFI::Struct

      layout :ether_dhost, [NativeTypes::UINT8,6]

    end
  end
end
