require 'ffi'

module FFI
  module Libnet
    module Headers
      class ARP < FFI::Struct

        NETROM = 0
        ETHER = 1
        AX25 = 3
        PRONET = 4
        CHAOS = 5
        IEEE802 = 6
        ARCNET = 7
        APPLETALK = 8
        LANSTAR = 9
        DLCI = 15
        ATM = 19
        METRICOM = 23
        IPSEC = 31

        REQUEST = 1
        REPLY = 2
        REQUEST_RESPONSE = 3
        REPLY_RESPONSE = 4
        INVALID_REQUEST = 8
        INVALID_REPLY = 9

        layout :ar_hrd, :uint16,
               :ar_pro, :uint16,
               :ar_hln, :uint8,
               :ar_pln, :uint8,
               :ar_op, :uint16

      end
    end
  end
end
