require 'ffi'

module FFI
  def self.alias_type(type,aliased)
    add_typedef(find_type(type),aliased.to_sym)
  end

  alias_type :int32, :libnet_ptag_t
  alias_type :uint32, :n_time

end
