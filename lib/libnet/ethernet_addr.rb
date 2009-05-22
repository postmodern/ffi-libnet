require 'ffi'

module FFI
  module Libnet
    class EthernetAddr < FFI::Struct

      layout :ether_dhost, [NativeTypes::UINT8,6]

    end
  end
end
