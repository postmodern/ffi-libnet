require 'ffi'

module FFI
  module Libnet
    module Headers
      module IEEE802
        class Ethernet < FFI::Struct

          ADDR_LEN = 6

          layout :dhost, [NativeTypes::UINT8, ADDR_LEN],
                 :shost, [NativeTypes::UINT8, ADDR_LEN],
                 :len, :int16

        end
      end
    end
  end
end
