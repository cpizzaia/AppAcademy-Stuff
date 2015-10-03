def range(start_num,end_num)
  result=[start_num]
  if end_num < start_num
    return []
  elsif start_num == end_num
    return [end_num]
  else
    result += range(start_num+1,end_num)
  end
  result
end

def exponential1(base,exp)
  if exp == 0
    return 1
  end
    base * exponential1(base, exp - 1)
end

def exponential2(base, exp)
  if exp == 1
    return base
  elsif exp.even?
    result = exponential2(base, exp / 2)
    result * result
  else
    base * exponential2(exponential2(base, ((exp - 1) / 2)), 2)
  end
end

class Array
  def deep_dup
    result = []
      if self.is_a? Array
        self.each do |el|
          if el.is_a? Array
            el.deep_dup
          else
            result << el
          end
        end
      end
  end
end



def fibonacci(n)
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2
    if n > 2
      previous = fibonacci(n-1)
      previous << previous[-1] + previous[-2]
    end
    previous
end

def bsearch(array, target)
  midpoint = array.length/2
  if array[0] == target
    0
  elsif array.length == 1
    nil
  elsif target >= array[midpoint...array.length][0]
    bsearch_result = bsearch(array[midpoint...array.length], target)
    if bsearch_result.nil?
      nil
    else
      array.length/2 + bsearch_result
    end
  else
    bsearch_result = bsearch(array[0...midpoint], target)
    if bsearch_result.nil?
      nil
    else
      array.length/2 + bsearch_result
    end
  end
end

def make_change(target,denoms)
  denoms.each do |coin|
    return [coin] if target - coin == 0
  end

  best_change = nil
  denoms.each do |coin|
    next if target - coin <= 0

    previous_best_change = make_change(target - coin,denoms)
    current_best_change = previous_best_change + [coin]

    if best_change.nil? || best_change.length > current_best_change.length
      best_change = current_best_change
    end
  end

  best_change
end

def merge_sort(array)
  if array.length <= 2
    if array[1].nil?
      merge([array[0]], [])
    else
      merge([array[0]],[array[1]])
    end
  else
    merge(merge_sort(array[0...array.length/2]),merge_sort(array[array.length/2...array.length]))
  end
end

def merge(array1,array2)
  result = []
  merged = false
  i = 0
  j = 0
  while(!merged)
    if j == array2.length || (i != array1.length && array1[i] < array2[j])
      result << array1[i]
      i += 1
    else
      result << array2[j]
      j += 1
    end
    if i == array1.length && j == array2.length
      merged = true
    end
  end
  result
end

def subsets(array)
  temp_array = array.dup
  if array.empty?
    [[]]
  else
    value = temp_array.pop
    previous_array = subsets(temp_array)
    for i in 0..previous_array.length-1
      previous_array << previous_array[i] + [value]
    end
    previous_array


  end

end
