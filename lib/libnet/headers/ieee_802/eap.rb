require 'ffi'

module FFI
  module Libnet
    module Headers
      module IEEE802
        class EAP < FFI::Struct

          PACKET = 0x00   # 802.1x packet
          START = 0x01    # 802.1x start
          LOGOFF = 0x02   # 802.1x logoff
          KEY = 0x03      # 802.1x key
          ENCASFAL = 0x04 # 802.1x encasfal

          layout :dot1x_version, :uint8,
            :dot1x_type, :uint8,
            :dot1x_length, :uint16

        end
      end
    end
  end
end
