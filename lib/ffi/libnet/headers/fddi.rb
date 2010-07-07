require 'ffi'

module FFI
  module Libnet
    module Headers
      class FDDI < FFI::Struct

        ADDR_LEN = 6

        LLC_FRAME = 0x10
        ADDR_48BIT = 0x40
        FC_REQD = LLC_FRAME | ADDR_48BIT

        TYPE_IP = 0x0800
        TYPE_ARP = 0x0806
        TYPE_REVARP = 0x8035

        layout :fddi_frame_control, :uint8,
               :fddi_dhost, [NativeTypes::UINT8, ADDR_LEN],
               :fddi_shost, [NativeTypes::UINT8, ADDR_LEN],
               :fddi_llc_dsap, :uint8,
               :fddi_llc_ssap, :uint8,
               :fddi_llc_control_field, :uint8,
               :fddi_llc_org_code, [NativeTypes::UINT8, ORG_CODE_SIZE],
               :fddi_type, :uint8,
               :fddi_type1, :uint8

      end
    end
  end
end
