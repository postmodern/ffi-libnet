require 'ffi'

module FFI
  module Libnet
    module Headers
      module IEEE802
        class SNAP< FFI::Struct

          layout :snap_dsap, :uint8,
                 :snap_ssap, :uint8,
                 :snap_control, :uint8,
                 :snapp_oui, [:uint8, 3],
                 :snap_type, :uint16

        end
      end
    end
  end
end
