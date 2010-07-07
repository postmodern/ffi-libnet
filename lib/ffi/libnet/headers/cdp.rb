require 'ffi'

module FFI
  module Libnet
    module Headers
      class CDP < FFI::Struct

        DEVID = 0x01
        ADDRESS = 0x02
        PORTID = 0x03
        CAPABIL = 0x04
        VERSION = 0x05
        PLATFORM = 0x06
        IPPREFIX = 0x07

        CAP_L3R = 0x01
        CAP_L2B = 0x02
        CAP_L2SRB = 0x04
        CAP_L2S = 0x08
        CAP_SR = 0x10
        CAP_NOI = 0x20
        CAP_L1F = 0x40

        layout :cdp_version, :uint8,
               :cdp_ttl, :uint8,
               :cdp_sum, :uint16,
               :cdp_type, :uint16,
               :cdp_len, :uint16
      end
    end
  end
end
