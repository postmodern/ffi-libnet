require 'ffi'

module FFI
  module Libnet
    module Headers
      module IEEE802
        class LLC < FFI::Struct

          SAP_STP = 0x42
          SAP_SNAP = 0xaa

          layout :llc_dsap, :uint8,
                 :llc_ssap, :uint8,
                 :llc_control, :uint8

        end
      end
    end
  end
end
