# TODO: write with RSpec

# `extend` adds the instance methods of modules to the singleton class for `self`.
# `include` adds the instance methods of modules to `self`.
# You cannot `include` modules for objects already instantiated,
# which are not able to make new instances any more from it.

module M
  def instance_method
    :instance_method
  end

  def self.singleton_method
    :singleton_method
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

# M.instance_method #=> NoMethodError
M.singleton_method #=> :singleton_method
Extended.instance_method #=> :instance_method
# Extended.singleton_method #=> NoMethodError
# e.instance_method #=> NoMethodError
# e.singleton_method #=> NoMethodError
# Included.instance_method #=> NoMethodError
# Included.singleton_method #=> NoMethodError
i.instance_method #=> :instance_method
# i.singleton_method #=> NoMethodError
oe.instance_method #=> :instance_method
# oe.singleton_method #=> NoMethodError
