require 'libnet/typedefs'

require 'ffi'

module FFI
  module Libnet
    class Context < FFI::Struct
      LINK = 0x00            # link-layer interface
      RAW4 = 0x01            # raw socket interface (ipv4)
      RAW6 = 0x02            # raw socket interface (ipv6)
                             # the following should actually set a flag in the flags variable above
      LINK_ADV = 0x08        # advanced mode link-layer
      RAW4_ADV = 0x09        # advanced mode raw socket (ipv4)
      RAW6_ADV = 0x0a        # advanced mode raw socket (ipv6)
      ADV_MASK = 0x08        # mask to determine adv mode

      layout :fd, :int,
             :injection_type, :int,
             :protocol_blocks, :pointer,
             :pblock_end, :pointer,
             :n_pblocks, :uint32,
             :link_type, :int,
             :link_offset, :int,
             :aligner, :int,
             :device, :string,
             :stats, Stats,
             :ptag_state, :libnet_ptag_t,
             :label, [:char, LABEL_SIZE],
             :err_buf, [:char, ERRBUF_SIZE],
             :total_size, :uint32

    end
  end
end
