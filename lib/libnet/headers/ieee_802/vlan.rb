require 'ffi'

module FFI
  module Libnet
    module Headers
      module IEEE802
        class VLAN < FFI::Struct

          ADDR_LEN = 6

          PRIMASK = 0x0007 # priority mask
          CFIMASK = 0x0001 # CFI mask
          VIDMASK = 0x0fff # vid mask

          layout :vlan_dhost, [NativeTypes::UINT8, ADDR_LEN],
            :vlan_shost, [NativeTypes::UINT8, ADDR_LEN],
            :vlan_tpi, :uint16,
            :vlan_priority_c_vid, :uint16,
            :vlan_len, :uint16

        end
      end
    end
  end
end
