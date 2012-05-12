require 'ffi/libnet/types'
require 'ffi/libnet/in6_addr'
require 'ffi/libnet/context'

require 'ffi'

module FFI
  module Libnet
    extend FFI::Library

    ffi_lib ['libnet', 'libnet.so.1']

    attach_function :libnet_init, [:int, :string, :buffer_out], :pointer
    attach_function :libnet_destroy, [:pointer], :void

    attach_function :libnet_clear_packet, [:pointer], :void
    attach_function :libnet_stats, [:pointer, :pointer], :void

    attach_function :libnet_getfd, [:pointer], :int
    attach_function :libnet_getdevice, [:pointer], :string
    attach_function :libnet_getpbuf, [:pointer, :libnet_ptag_t], :pointer
    attach_function :libnet_getpbuf_size, [:pointer, :libnet_ptag_t], :uint32
    attach_function :libnet_geterror, [:pointer], :string
    attach_function :libnet_getpacket_size, [:pointer], :uint32
    attach_function :libnet_seed_prand, [:pointer], :int
    attach_function :libnet_get_prand, [:int], :uint32

    attach_function :libnet_toggle_checksum, [:pointer, :libnet_ptag_t, :int], :int

    attach_function :libnet_addr2name4, [:uint32, :uint8], :string
    attach_function :libnet_name2addr4, [:pointer, :string, :uint8], :uint32
    attach_function :libnet_name2addr6, [:pointer, :string, :uint8], In6Addr
    attach_function :libnet_addr2name6_r, [In6Addr, :uint8, :string, :int], :void

    attach_function :libnet_plist_chain_new, [:pointer, :pointer, :string], :int
    attach_function :libnet_plist_chain_next_pair, [:pointer, :pointer, :pointer], :int
    attach_function :libnet_plist_chain_dump, [:pointer], :int
    attach_function :libnet_plist_chain_dump_string, [:pointer], :string
    attach_function :libnet_plist_chain_free, [:pointer], :int

    def Libnet.build(name,arguments)
      attach_function :"libnet_build_#{name}", arguments + [:pointer, :uint32, :pointer, :libnet_ptag_t], :libnet_ptag_t
    end

    def Libnet.auto_build(name,arguments)
      attach_function :"libnet_autobuild_#{name}", arguments + [:pointer], :libnet_ptag_t
    end

    build '802_1q', [:pointer, :pointer, :uint16, :uint8, :uint8, :uint16, :uint16]
    build '802_1x', [:uint8, :uint8, :uint16]
    build '802_2', [:uint8, :uint8, :uint8]
    build '802_2snap', [:uint8, :uint8, :uint8, :pointer, :uint16]
    build '802_3', [:pointer, :pointer, :uint16]

    build 'ethernet', [:pointer, :pointer, :uint16]
    auto_build 'ethernet', [:pointer, :uint16]

    build 'fddi', [:uint8, :pointer, :pointer, :uint8, :uint8, :uint8, :pointer, :uint16]
    auto_build 'fddi', [:uint8, :pointer, :uint8, :uint8, :uint8, :pointer, :uint16]

    build 'arp', [:uint16, :uint16, :uint8, :uint8, :uint16, :pointer, :pointer, :pointer, :pointer]
    auto_build 'arp', [:uint16, :pointer, :pointer, :pointer, :pointer]

    build 'tcp', [:uint16, :uint16, :uint32, :uint32, :uint8, :uint16, :uint16, :uint16, :uint16]
    build 'tcp_options', []

    build 'udp', [:uint16, :uint16, :uint16, :uint16]

    build 'cdp', [:uint8, :uint8, :uint16, :uint16, :uint16, :pointer]

    build 'icmpv4_echo', [:uint8, :uint8, :uint16, :uint16, :uint16]
    build 'icmpv4_mask', [:uint8, :uint8, :uint16, :uint16, :uint16, :uint32]
    build 'icmpv4_unreach', [:uint8, :uint8, :uint16]
    build 'icmpv4_redirect', [:uint8, :uint8, :uint16, :uint32]
    build 'icmpv4_timeexceed', [:uint8, :uint8, :uint16]
    build 'icmpv4_timestamp', [:uint8, :uint8, :uint16, :uint16, :uint16, :n_time, :n_time, :n_time]

    build 'igmp', [:uint8, :uint8, :uint16, :uint32]

    build 'ipv4', [:uint16, :uint8, :uint16, :uint16, :uint8, :uint8, :uint16, :uint32, :uint32]
    build 'ipv4_options', []
    auto_build 'ipv4', [:uint16, :uint8, :uint32]

    build 'ipv6', [:uint8, :uint32, :uint16, :uint8, :uint8, In6Addr, In6Addr]
    build 'ipv6_frag', [:uint8, :uint8, :uint16, :uint32]
    build 'ipv6_routing', [:uint8, :uint8, :uint8, :uint8]
    build 'ipv6_destopts', [:uint8, :uint8]
    build 'ipv6_hbhopts', [:uint8, :uint8]
    auto_build 'ipv6', [:uint16, :uint8, In6Addr]

    build 'isl', [:pointer, :uint8, :uint8, :pointer, :uint16, :pointer, :uint16, :uint16, :uint16]

    build 'ipsec_esp_hdr', [:uint32, :uint32, :uint32]
    build 'ipsec_esp_ftr', [:uint8, :uint8, :pointer]
    build 'ipsec_ah', [:uint8, :uint8, :uint16, :uint32, :uint32, :uint32]

    build 'dnsv4', [:uint16, :uint16, :uint16, :uint16, :uint16, :uint16, :uint16]

    build 'rip', [:uint8, :uint8, :uint16, :uint16, :uint16, :uint32, :uint32, :uint32, :uint32]

    build 'rpc_call', [:uint32, :uint32, :uint32, :uint32, :uint32, :uint32, :uint32, :pointer, :uint32, :uint32, :pointer]

    build 'stp_conf', [:uint16, :uint8, :uint8, :uint8, :pointer, :uint32, :pointer, :uint16, :uint16, :uint16, :uint16, :uint16]
    build 'stp_tcn', [:uint16, :uint8, :uint8]

    build 'token_ring', [:uint8, :uint8, :pointer, :pointer, :uint8, :uint8, :uint8, :pointer, :uint16]
    auto_build 'token_ring', [:uint8, :uint8, :pointer, :uint8, :uint8, :uint8]

    build 'vrrp', [:uint8, :uint8, :uint8, :uint8, :uint8, :uint8, :uint8, :uint16]

    build 'mpls', [:uint32, :uint8, :uint8, :uint8]

    build 'ntp', [:uint8, :uint8, :uint8, :uint8, :uint8, :uint8, :uint16, :uint16, :uint16, :uint16, :uint32, :uint32, :uint32, :uint32, :uint32, :uint32, :uint32, :uint32, :uint32]

    build 'ospfv2', [:uint16, :uint8, :uint32, :uint32, :uint16, :uint16]
    build 'ospfv2_hello', [:uint32, :uint16, :uint8, :uint8, :uint, :uint32, :uint32]
    build 'ospfv2_dbd', [:uint16, :uint8, :uint8, :uint]
    build 'ospfv2_lsr', [:uint, :uint, :uint32]
    build 'ospfv2_lsu', [:uint]
    build 'ospfv2_lsa', [:uint16, :uint8, :uint8, :uint, :uint32, :uint, :uint16, :uint16]
    build 'ospfv2_lsa_rtr', [:uint16, :uint16, :uint, :uint, :uint8, :uint8, :uint16]
    build 'ospfv2_lsa_net', [:uint32, :uint]
    build 'ospfv2_lsa_sum', [:uint32, :uint, :uint]
    build 'ospfv2_lsa_as', [:uint32, :uint, :uint32, :uint]

    build 'data', []

    build 'dhcpv4', [:uint8, :uint8, :uint8, :uint8, :uint32, :uint16, :uint16, :uint16, :uint32, :uint32, :uint32, :uint32, :pointer, :pointer, :pointer]

    build 'bootpv4', [:uint8, :uint8, :uint8, :uint8, :uint32, :uint16, :uint16, :uint32, :uint32, :uint32, :uint32, :pointer, :pointer, :pointer]

    attach_function :libnet_getgre_length, [:uint16], :uint32
    build 'gre', [:uint16, :uint16, :uint16, :uint16, :uint32, :uint32, :uint16]
    build 'egre', [:uint16, :uint16, :uint16, :uint16, :uint32, :uint32, :uint32]
    build 'gre_sre', [:uint16, :uint8, :uint8, :pointer]
    attach_function :libnet_build_gre_last_sre, [:pointer, :libnet_ptag_t], :libnet_ptag_t

    build 'bgp4_header', [:pointer, :uint16, :uint8]
    build 'bgp4_open', [:uint8, :uint16, :uint16, :uint32, :uint8]
    build 'bgp4_update', [:uint16, :pointer, :uint16, :pointer, :uint16, :pointer]
    build 'bgp4_notification', [:uint8, :uint8]

    build 'sebek', [:uint32, :uint16, :uint16, :uint32, :uint32, :uint32, :uint32, :uint32, :uint32, :pointer, :uint32]

    build 'hsrp', [:uint8, :uint8, :uint8, :uint8, :uint8, :uint8, :uint8, :uint8, :pointer, :uint32]

    build 'link', [:pointer, :pointer, :pointer, :uint16]
    auto_build 'link', [:pointer, :pointer, :uint16]

    attach_function :libnet_write, [:pointer], :int

    attach_function :libnet_get_ipaddr4, [:pointer], :uint32
    attach_function :libnet_get_ipaddr6, [:pointer], In6Addr
    attach_function :libnet_get_hwaddr, [:pointer], :pointer
    attach_function :libnet_hex_aton, [:string, :pointer], :pointer
    attach_function :libnet_version, [], :string

    attach_function :libnet_adv_cull_packet, [:pointer, :pointer, :pointer], :int
    attach_function :libnet_adv_cull_header, [:pointer, :libnet_ptag_t, :pointer, :pointer], :int

    attach_function :libnet_adv_write_link, [:pointer, :pointer, :uint32], :int
    attach_function :libnet_adv_write_raw_ipv4, [:pointer, :pointer, :uint32], :int

    attach_function :libnet_adv_free_packet, [:pointer, :pointer], :void
    
    attach_function :libnet_cq_add, [:pointer, :string], :int
    attach_function :libnet_cq_remove, [:pointer], :pointer
    attach_function :libnet_cq_remove_by_label, [:string], :pointer
    attach_function :libnet_cq_getlabel, [:pointer], :string
    attach_function :libnet_cq_find_by_label, [:string], :pointer
    attach_function :libnet_cq_destroy, [], :void
    attach_function :libnet_cq_head, [], :pointer
    attach_function :libnet_cq_last, [], :int
    attach_function :libnet_cq_next, [], :pointer
    attach_function :libnet_cq_size, [], :uint32
    attach_function :libnet_cq_end_loop, [], :uint32

    attach_function :libnet_diag_dump_context, [:pointer], :void
    attach_function :libnet_diag_dump_pblock, [:pointer], :void
    attach_function :libnet_diag_dump_pblock_type, [:uint8], :string
    attach_function :libnet_diag_dump_hex, [:pointer, :uint32, :int, :pointer], :void

    attach_function :libnet_write_raw_ipv4, [:pointer, :pointer, :uint32], :int
    attach_function :libnet_write_raw_ipv6, [:pointer, :pointer, :uint32], :int
    attach_function :libnet_write_link, [:pointer, :pointer, :uint32], :int

    attach_function :libnet_open_raw4, [:pointer], :int
    attach_function :libnet_close_raw4, [:pointer], :int

    attach_function :libnet_open_raw6, [:pointer], :int
    attach_function :libnet_close_raw6, [:pointer], :int

    attach_function :libnet_select_device, [:pointer], :int

    attach_function :libnet_open_link, [:pointer], :int
    attach_function :libnet_close_link, [:pointer], :int

    attach_function :libnet_do_checksum, [:pointer, :pointer, :int, :int], :int
    attach_function :libnet_compute_crc, [:pointer, :uint32], :uint32
    attach_function :libnet_ip_check, [:pointer, :int], :uint16
    attach_function :libnet_in_cksum, [:pointer, :int], :uint16

    attach_function :libnet_pblock_probe, [:pointer, :libnet_ptag_t, :uint32, :uint8], :pointer
    attach_function :libnet_pblock_new, [:pointer, :uint32], :pointer
    attach_function :libnet_pblock_swap, [:pointer, :libnet_ptag_t, :libnet_ptag_t], :int
    attach_function :libnet_pblock_insert_before, [:pointer, :libnet_ptag_t, :libnet_ptag_t], :int
    attach_function :libnet_pblock_delete, [:pointer, :pointer], :void
    attach_function :libnet_pblock_update, [:pointer, :pointer, :uint32], :libnet_ptag_t
    attach_function :libnet_pblock_find, [:pointer, :libnet_ptag_t], :pointer
    attach_function :libnet_pblock_append, [:pointer, :pointer, :pointer, :uint32], :int
    attach_function :libnet_pblock_setflags, [:pointer, :uint8], :void
    attach_function :libnet_pblock_p2p, [:uint8], :int
    attach_function :libnet_pblock_coalesce, [:pointer, :pointer, :pointer], :int

    attach_function :libnet_check_iface, [:pointer], :int

    #
    # @param [Symbol] type
    #   The type. Can be one of:
    #
    #   * `:none`
    #   * `:link`
    #   * `:raw4`
    #   * `:raw6`
    #
    # @param [String] device
    #   The device to use.
    #
    # @raise [ArgumentError]
    #   An invalid type was given.
    #
    # @raise [RuntimeError]
    #   Could not open the libnet context.
    #
    # @return [Context]
    #   The newly created context.
    #
    def self.init(type,device)
      type = case type
             when :none
               Context::NONE
             when :link
               Context::LINK
             when :raw4
               Context::RAW4
             when :raw6
               Context::RAW6
             else
               raise(ArgumentError,"unknown link type: #{type}")
             end

      errbuf  = Buffer.new(ERRBUF_SIZE)
      context_ptr = libnet_init(type,device,errbuf)

      if context_ptr.null?
        raise("Could not open libnet context: " + errbuf.get_string(0))
      end

      return Context.new(context_ptr)
    end
  end
end
