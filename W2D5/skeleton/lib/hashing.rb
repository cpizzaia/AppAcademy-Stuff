require 'byebug'
class Array
  def hash
    return 1 if empty?
    map.with_index { |el, i| (((i + 2)**2) *  el.hash).abs.to_s }.join.to_i
  end
end

class String
  def hash
    return ord if length <= 1
    chars.hash
  end
end

class Hash
  def hash
    to_a.sort_by { |k, v| k.hash }.hash
  end
end
