require 'ffi'

module FFI
  module Libnet
    module Headers
      class BGP4Open < FFI::Struct

        layout :version, :uint8,
               :src_as, :uint16,
               :hold_time, :uint16,
               :bgp_id, :uint32,
               :opt_len, :uint8

      end
    end
  end
end
