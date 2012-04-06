require 'ffi'

module FFI
  module Libnet
    class EtherAddr < FFI::Struct

      layout :ether_dhost, [:uint8, 6]

    end
  end
end
