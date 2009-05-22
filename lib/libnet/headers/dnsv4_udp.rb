require 'ffi'

module FFI
  module Libnet
    module Headers
      class DNSv4UDP < FFI::Struct

        layout :h_len, :uint16,
               :id, :uint16,
               :flags, :uint16,
               :num_q, :uint16,
               :num_answ_rr, :uint16,
               :num_auth_rr, :uint16,
               :num_addi_rr, :uint16

      end
    end
  end
end
