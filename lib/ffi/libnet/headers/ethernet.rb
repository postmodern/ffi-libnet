require 'ffi'

module FFI
  module Libnet
    module Headers
      class Ethernet < FFI::Struct

        ADDR_LEN = 6

        TYPE_PUP = 0x0200  # PUP protocol
        TYPE_IP  = 0x0800  # IP protocol
        TYPE_ARP = 0x0806  # addr. resolution protocol
        TYPE_REVARP = 0x8035  # reverse addr. resolution protocol
        TYPE_VLAN = 0x8100  # IEEE 802.1Q VLAN tagging
        TYPE_EAP = 0x888e  # IEEE 802.1X EAP authentication
        TYPE_MPLS = 0x8847  # MPLS
        TYPE_LOOPBACK = 0x9000  # used to test interfaces

        layout :ether_dhost, [NativeTypes::UINT8, ADDR_LEN],
               :ether_shot, [NativeTypes::UINT8, ADDR_LEN],
               :ether_type, :uint16

      end
    end
  end
end
