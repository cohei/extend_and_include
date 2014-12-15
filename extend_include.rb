# TODO: write with RSpec

# `extend` adds the instance methods of modules to the singleton class for `self`.
# `include` adds the instance methods of modules to `self`.
# You cannot `include` modules for objects already instantiated,
# which are not able to make new instances any more from it.

module M
  def m_instance_method
    true
  end

  def self.m_singleton_method
    true
  end
end

class Extended
  extend M
end
e = Extended.new

class Included
  include M
end
i = Included.new

class O
end
o = O.new
oe = o.extend M
# oi = o.include M #=> NoMethodError

# M.m_instance_method #=> NoMethodError
M.m_singleton_method #=> true
Extended.m_instance_method #=> true
# Extended.m_singleton_method #=> NoMethodError
# e.m_instance_method #=> NoMethodError
# e.m_singleton_method #=> NoMethodError
# Included.m_instance_method #=> NoMethodError
# Included.m_singleton_method #=> NoMethodError
i.m_instance_method #=> true
# i.m_singleton_method #=> NoMethodError
oe.m_instance_method #=> true
# oe.m_singleton_method #=> NoMethodError
