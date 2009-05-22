require 'ffi'

module FFI
  module Libnet
    module Headers
      class CDPValue < FFI::Struct

        layout :cdp_type, :uint16,
               :cdp_len, :uint16

      end
    end
  end
end
