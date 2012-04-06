require 'ffi'

module FFI
  module Libnet
    module Headers
      class BGP4 < FFI::Struct

        MARKER_SIZE = 16

        OPEN = 1
        UPDATE = 2
        NOTIFICATION = 3
        KEEP_ALIVe = 4

        layout :marker, [:uint8, MARKER_SIZE],
               :len, :uint16,
               :type, :uint8

      end
    end
  end
end
