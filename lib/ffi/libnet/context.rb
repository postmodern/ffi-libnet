require 'ffi/libnet/types'
require 'ffi/libnet/stats'
require 'ffi/libnet/ether_addr'

require 'ffi'

module FFI
  module Libnet
    class Context < FFI::Struct
      NONE = 0xf8            # no injection type, only construct packets
      LINK = 0x00            # link-layer interface
      RAW4 = 0x01            # raw socket interface (ipv4)
      RAW6 = 0x02            # raw socket interface (ipv6)

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

      def get_hwaddr
        EtherAddr.new(Libnet.libnet_get_hwaddr(self))
      end

      def clear_packet
        Libnet.libnet_clear_packet(self)
      end

      def write
        Libnet.libnet_write(self)
      end

      def stats
        self[:stats]
      end

      def destroy
        Libnet.libnet_destroy(self)
      end

    end
  end
end
