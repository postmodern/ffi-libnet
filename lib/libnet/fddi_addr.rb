require 'ffi'

module FFI
  module Libnet
    class FDDIAddr < FFI::Struct

      layout :fddi_addr_octets, [NativeTypes::UINT8, 6]

    end
  end
end
