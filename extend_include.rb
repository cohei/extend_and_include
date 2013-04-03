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
