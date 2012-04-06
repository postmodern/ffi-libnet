require 'ffi'

module FFI
  module Libnet
    module Headers
      module IEEE802
        class Ethernet < FFI::Struct

          ADDR_LEN = 6

          layout :dhost, [:uint8, ADDR_LEN],
                 :shost, [:uint8, ADDR_LEN],
                 :len, :int16

        end
      end
    end
  end
end
