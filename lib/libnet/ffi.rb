require 'libnet/typedefs'

require 'ffi'

module FFI
  module Libnet
    extend FFI::Library

    ffi_lib 'libnet'

  end
end
