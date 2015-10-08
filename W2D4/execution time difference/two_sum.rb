require 'byebug'
def bad_two_sum?(arr, target_sum) # O(n^2) complexity- two loops!!!!
  arr.each.with_index do |el, i|
    j = i + 1
    while j < arr.length
      return true if el + arr[j] == target_sum
      j += 1
    end
  end

  false
end


def sort_two_sum(arr, target_sum) #O(nlog(n))
  sort_arr = arr.dup.sort

  i=0
  j=sort_arr.length-1
  while i < j
    case sort_arr[i] + sort_arr[j] <=> target_sum
    when 0
      return true
    when -1
      i += 1
    when 1
      j -= 1
    end
  end
  false
end





def bsearch?(arr, target)
  return false if arr.empty?
  mid = arr.length/2
  return true if arr[mid] == target
  case arr[mid] <=> target
  when 1
    bsearch?(arr[(mid + 1)...arr.length], target)
  when -1
    bsearch?(arr[0...mid], target)
  end
end



def hash_map_two_sum(arr, target) # O(n)
  num_hash = Hash.new
  arr.each do |el|
    num_hash[el]= target - el
  end

  num_hash.each do |key,value|
    value = num_hash[key]
    next if value == key
    return true if num_hash.has_key?(value)
  end

  false
end
