require 'ffi'

module FFI
  module Libnet
    class FDDIAddr < FFI::Struct

      layout :fddi_addr_octets, [:uint8, 6]

    end
  end
end
