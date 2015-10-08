def my_min1(list)
  lowest_num = nil
  for i in 0..list.length-1
    for j in 0..list.length-1
      lowest_num = list[i] if lowest_num.nil?
      if lowest_num > list[j]
        lowest_num = list[i]
      end
    end
  end
  lowest_num
end

def my_min2(list)
  lowest_num = list.first
  for i in 0..list.length-1
    if lowest_num > list[i]
      lowest_num = list[i]
    end
  end
  lowest_num
end

def largest_contiguous_sub_sum1(list)

  largest_sum = list[0] + list[1]
  for i in 0..list.length-1
    run_sum = i
    for j in i..list.length-1

      if i != j
        run_sum += list[j]
      end
      if largest_sum < run_sum
        largest_sum = run_sum
      end
    end
  end
  largest_sum
end

def largest_contiguous_sub_sum2(list)
  sub_sum_array = []
  largest_sub_sum = 0
  run_sum = 0


  list.each do |el|
    run_sum += el
    if run_sum < 0
      run_sum = 0
    elsif largest_sub_sum < run_sum
      largest_sub_sum = run_sum
    end
  end
  largest_sub_sum

end
