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

      def fd
        self[:fd]
      end

      alias fd get_fd

      def device
        self[:device]
      end

      alias device get_device

      def get_hwaddr
        EtherAddr.new(Libnet.libnet_get_hwaddr(self))
      end

      def get_ipaddr4
        Libnet.libnet_get_ipaddr4(self)
      end

      def get_ipaddr6
        In6Addr.new(Libnet.libnet_get_ipaddr6(self))
      end

      def get_pbuf(ptag)
        Libnet.libnet_getpbuf(self,ptag)
      end

      def get_pbuf_size(ptag)
        Libnet.libnet_getpbuf_size(self,ptag)
      end

      def get_packet_size
        Libnet.libnet_getpacket_size(self)
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

      def err_buf
        self[:err_buf]
      end

      alias err_buf get_error

      def destroy
        Libnet.libnet_destroy(self)
      end

    end
  end
end
