require 'ffi'

module FFI
  module Libnet
    module Headers
      class BGP4Notification < FFI::Struct

        ERROR_CODES = [
          MESSAGE_HEADER_ERROR = 1,
          OPEN_MESSAGE_ERROR = 2,
          UPDATE_MESSAGE_ERROR = 3,
          HOLD_TIMER_EXPIRED = 4,
          FINITE_STATE_ERROR = 5,
          CEASE = 6
        ]

        ERROR_SUBCODES = [
          CONNECTION_NOT_SYNCHRONIZED = 1,
          BAD_MESSAGE_LENGTH = 2,
          BAD_MESSAGE_TYPE = 3,
          UNSUPPORTED_VERSION_NUMBER = 1,
          BAD_PEER_AS = 2,
          BAD_BGP_IDENTIFIER = 3,
          UNSUPPORTED_OPTIONAL_PARAMETER = 4,
          AUTHENTICATION_FAILURE = 5,
          UNACCEPTABLE_HOLD_TIME = 6,
          MALFORMED_ATTRIBUTE_LIST = 0,
          UNRECOGNIZED_WELL_KNOWN_ATTRIBUTE = 0,
          MISSING_WELL_KNOWN_ATTRIBUTE = 0,
          ATTRIBUTE_FLAGS_ERROR = 0,
          ATTRIBUTE_LENGTH_ERROR = 0,
          INVALID_ORIGIN_ATTRIBUTE = 0,
          AS_ROUTING_LOOP = 0,
          INVALID_NEXT_HOP_ATTRIBUTE = 0,
          OPTIONAL_ATTRIBUTE_ERROR = 0,
          INVALID_NETWORK_FIELD = 0,
          MALFORMED_AS_PATH = 0
        ]

        layout :err_code, :uint8,
               :err_subcode, :uint8

      end
    end
  end
end
