require 'ffi'

module FFI
  module Libnet
    module Headers
      class DHCPv4 < FFI::Struct

        REQUEST = 0x01
        REPLY = 0x02

        MAGIC = 0x63825363

        BOOTP_MIN_LEN = 0x12c
        DHCP_PAD = 0x00
        DHCP_SUBNETMASK = 0x01
        DHCP_TIMEOFFSET = 0x02
        DHCP_ROUTER = 0x03
        DHCP_TIMESERVER = 0x04
        DHCP_NAMESERVER = 0x05
        DHCP_DNS = 0x06
        DHCP_LOGSERV = 0x07
        DHCP_COOKIESERV = 0x08
        DHCP_LPRSERV = 0x09
        DHCP_IMPSERV = 0x0a
        DHCP_RESSERV = 0x0b
        DHCP_HOSTNAME = 0x0c
        DHCP_BOOTFILESIZE = 0x0d
        DHCP_DUMPFILE = 0x0e
        DHCP_DOMAINNAME = 0x0f
        DHCP_SWAPSERV = 0x10
        DHCP_ROOTPATH = 0x11
        DHCP_EXTENPATH = 0x12
        DHCP_IPFORWARD = 0x13
        DHCP_SRCROUTE = 0x14
        DHCP_POLICYFILTER = 0x15
        DHCP_MAXASMSIZE = 0x16
        DHCP_IPTTL = 0x17
        DHCP_MTUTIMEOUT = 0x18
        DHCP_MTUTABLE = 0x19
        DHCP_MTUSIZE = 0x1a
        DHCP_LOCALSUBNETS = 0x1b
        DHCP_BROADCASTADDR = 0x1c
        DHCP_DOMASKDISCOV = 0x1d
        DHCP_MASKSUPPLY = 0x1e
        DHCP_DOROUTEDISC = 0x1f
        DHCP_ROUTERSOLICIT = 0x20
        DHCP_STATICROUTE = 0x21
        DHCP_TRAILERENCAP = 0x22
        DHCP_ARPTIMEOUT = 0x23
        DHCP_ETHERENCAP = 0x24
        DHCP_TCPTTL = 0x25
        DHCP_TCPKEEPALIVE = 0x26
        DHCP_TCPALIVEGARBAGE = 0x27
        DHCP_NISDOMAIN = 0x28
        DHCP_NISSERVERS = 0x29
        DHCP_NISTIMESERV = 0x2a
        DHCP_VENDSPECIFIC = 0x2b
        DHCP_NBNS = 0x2c
        DHCP_NBDD = 0x2d
        DHCP_NBTCPIP = 0x2e
        DHCP_NBTCPSCOPE = 0x2f
        DHCP_XFONT = 0x30
        DHCP_XDISPLAYMGR = 0x31
        DHCP_DISCOVERADDR = 0x32
        DHCP_LEASETIME = 0x33
        DHCP_OPTIONOVERLOAD = 0x34
        DHCP_MESSAGETYPE = 0x35
        DHCP_SERVIDENT = 0x36
        DHCP_PARAMREQUEST = 0x37
        DHCP_MESSAGE = 0x38
        DHCP_MAXMSGSIZE = 0x39
        DHCP_RENEWTIME = 0x3a
        DHCP_REBINDTIME = 0x3b
        DHCP_CLASSSID = 0x3c
        DHCP_CLIENTID = 0x3d
        DHCP_NISPLUSDOMAIN = 0x40
        DHCP_NISPLUSSERVERS = 0x41
        DHCP_MOBILEIPAGENT = 0x44
        DHCP_SMTPSERVER = 0x45
        DHCP_POP3SERVER = 0x46
        DHCP_NNTPSERVER = 0x47
        DHCP_WWWSERVER = 0x48
        DHCP_FINGERSERVER = 0x49
        DHCP_IRCSERVER = 0x4a
        DHCP_STSERVER = 0x4b
        DHCP_STDASERVER = 0x4c
        DHCP_END = 0xff

        DHCP_MSGDISCOVER = 0x01
        DHCP_MSGOFFER = 0x02
        DHCP_MSGREQUEST = 0x03
        DHCP_MSGDECLINE = 0x04
        DHCP_MSGACK = 0x05
        DHCP_MSGNACK = 0x06
        DHCP_MSGRELEASE = 0x07
        DHCP_MSGINFORM = 0x08

        layout :dhcp_opcode, :uint8,
               :dhcp_htype, :uint8,
               :dhcp_hlen, :uint8,
               :dhcp_hopcount, :uint8,
               :dhcp_xid, :uint32,
               :dhcp_secs, :uint16,
               :dhcp_flags, :uint16,
               :dhcp_cip, :uint32,
               :dhcp_yip, :uint32,
               :dhcp_sip, :uint32,
               :dhcp_gip, :uint32,
               :dhcp_chaddr, [NativeTypes::UINT8, 16],
               :dhcp_sname, [NativeTypes::UINT8, 64],
               :dhcp_file, [NativeTypes::UINT8, 128],
               :dhcp_magic, :uint32

      end
    end
  end
end
