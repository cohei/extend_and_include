# `extend` adds the instance methods of modules to the singleton class for `self`.
# `include` adds the instance methods of modules to `self`.
# You cannot `include` modules for objects already instantiated,
# which are not able to make new instances any more from it.

module M
  def a
    :a
  end
  
  def self.b
    :b
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

# M.a #=> NoMethodError
M.b #=> :b
Extended.a #=> :a
# Extended.b #=> NoMethodError
# e.a #=> NoMethodError
# e.b #=> NoMethodError
# Included.a #=> NoMethodError
# Included.b #=> NoMethodError
i.a #=> :a
# i.b #=> NoMethodError
oe.a #=> :a
# oe.b #=> NoMethodError
