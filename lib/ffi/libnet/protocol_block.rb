require 'ffi/libnet/types'

require 'ffi'

module FFI
  module Libnet
    class ProtocolBlock < FFI::Struct

      PBLOCK_ARP = 0x01    # ARP header 
      PBLOCK_DHCPV4 = 0x02    # DHCP v4 header 
      PBLOCK_DNSV4 = 0x03    # DNS v4 header 
      PBLOCK_ETH = 0x04    # Ethernet header 
      PBLOCK_ICMPV4 = 0x05    # ICMP v4 base header 
      PBLOCK_ICMPV4_ECHO = 0x06    # ICMP v4 echo header 
      PBLOCK_ICMPV4_MASK = 0x07    # ICMP v4 mask header 
      PBLOCK_ICMPV4_UNREACH = 0x08    # ICMP v4 unreach header 
      PBLOCK_ICMPV4_TIMXCEED = 0x09    # ICMP v4 exceed header 
      PBLOCK_ICMPV4_REDIRECT = 0x0a    # ICMP v4 redirect header 
      PBLOCK_ICMPV4_TS = 0x0b    # ICMP v4 timestamp header 
      PBLOCK_IGMP = 0x0c    # IGMP header 
      PBLOCK_IPV4 = 0x0d    # IP v4 header 
      PBLOCK_IPO = 0x0e    # IP v4 options 
      PBLOCK_IPDATA = 0x0f    # IP data 
      PBLOCK_OSPF = 0x10    # OSPF base header 
      PBLOCK_OSPF = ELLO = 0x11    # OSPF hello header 
      PBLOCK_OSPF_DBD = 0x12    # OSPF dbd header 
      PBLOCK_OSPF_LSR = 0x13    # OSPF lsr header 
      PBLOCK_OSPF_LSU = 0x14    # OSPF lsu header 
      PBLOCK_OSPF_LSA = 0x15    # OSPF lsa header 
      PBLOCK_OSPF_AUTH = 0x16    # OSPF auth header 
      PBLOCK_OSPF_CKSUM = 0x17    # OSPF checksum header 
      PBLOCK_LS_RTR = 0x18    # linkstate rtr header 
      PBLOCK_LS_NET = 0x19    # linkstate net header 
      PBLOCK_LS_SUM = 0x1a    # linkstate as sum header 
      PBLOCK_LS_AS_EXT = 0x1b    # linkstate as ext header 
      PBLOCK_NTP = 0x1c    # NTP header 
      PBLOCK_RIP = 0x1d    # RIP header 
      PBLOCK_TCP = 0x1e    # TCP header 
      PBLOCK_TCPO = 0x1f    # TCP options 
      PBLOCK_TCPDATA = 0x20    # TCP data 
      PBLOCK_UDP = 0x21    # UDP header 
      PBLOCK_VRRP = 0x22    # VRRP header 
      PBLOCK_DATA = 0x23    # generic data 
      PBLOCK_CDP = 0x24    # CDP header 
      PBLOCK_IPSEC_ESP_HDR = 0x25    # IPSEC ESP header 
      PBLOCK_IPSEC_ESP_FTR = 0x26    # IPSEC ESP footer 
      PBLOCK_IPSEC_AH = 0x27    # IPSEC AH header 
      PBLOCK_802_1Q = 0x28    # 802.1q header 
      PBLOCK_802_2 = 0x29    # 802.2 header 
      PBLOCK_802_2SNAP = 0x2a    # 802.2 SNAP header 
      PBLOCK_802_3 = 0x2b    # 802.3 header 
      PBLOCK_STP_CONF = 0x2c    # STP configuration header 
      PBLOCK_STP_TCN = 0x2d    # STP TCN header 
      PBLOCK_ISL = 0x2e    # ISL header 
      PBLOCK_IPV6 = 0x2f    # IP v6 header 
      PBLOCK_802_1X = 0x30    # 802.1x header 
      PBLOCK_RPC_CALL = 0x31    # RPC Call header 
      PBLOCK_MPLS = 0x32    # MPLS header 
      PBLOCK_FDDI = 0x33    # FDDI header 
      PBLOCK_TOKEN_RING = 0x34    # TOKEN RING header 
      PBLOCK_BGP4 = EADER = 0x35    # BGP4 header 
      PBLOCK_BGP4_OPEN = 0x36    # BGP4 open header 
      PBLOCK_BGP4_UPDATE = 0x37    # BGP4 update header 
      PBLOCK_BGP4_NOTIFICATION = 0x38  # BGP4 notification header 
      PBLOCK_GRE = 0x39    # GRE header 
      PBLOCK_GRE_SRE = 0x3a    # GRE SRE header 
      PBLOCK_IPV6_FRAG = 0x3b    # IPv6 frag header 
      PBLOCK_IPV6_ROUTING = 0x3c    # IPv6 routing header 
      PBLOCK_IPV6_DESTOPTS = 0x3d    # IPv6 dest opts header 
      PBLOCK_IPV6_HBHOPTS = 0x3e    # IPv6 hop/hop opts header 
      PBLOCK_SEBEK = 0x3f    # Sebek header 
      PBLOCK_HSRP = 0x40    # HSRP header 

      PBLOCK_DO_CHECKSUM = 0x01    # needs a checksum

      layout :buf, :pointer,
             :b_len, :uint32,
             :h_len, :uint16,
             :ip_offset, :uint32,
             :copied, :uint32,
             :type, :uint8,
             :flags, :uint8,
             :ptag, :libnet_ptag_t,
             :next, :pointer,
             :prev, :pointer

      def next
        ProtocolBlock.new(self[:next])
      end

      def prev
        ProtocolBlock.new(self[:prev])
      end

    end
  end
end
