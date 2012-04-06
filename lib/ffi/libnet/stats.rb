require 'ffi'

module FFI
  module Libnet
    class Stats < FFI::Struct

      layout :packets_sent, :int64,
             :packet_errors, :int64,
             :bytes_written, :int64

    end
  end
end
