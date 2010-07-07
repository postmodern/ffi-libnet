require 'ffi'

module FFI
  module Libnet
    extend FFI::Library

    typedef :int32, :libnet_ptag_t
    typedef :uint32, :n_time
  end
end
