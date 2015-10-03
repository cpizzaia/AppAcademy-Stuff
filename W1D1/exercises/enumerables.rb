class Array
  def my_each
    for i in 0..self.length-1
      yield(self[i])
    end
    self
  end

  def my_select
    result = []

    self.my_each do |n|
      result << n if yield(n) == true
    end

    result
  end

  def my_reject
    result = []

    self.my_each do |n|
      result << n if yield(n) == false
    end
    result
  end

  def my_any?
    self.my_each do |n|
      return true if yield(n) == true
    end
    false
  end

  def my_all?
    self.my_each do |n|
      return false if yield(n) == false
    end
    true
  end

  def my_flatten
    result = []
    for i in 0..self.length-1
      if self[i].class == Array
        result += self[i].my_flatten
      else
        result << self[i]
      end
    end
    result
  end

  def my_zip(*arr)
    result = []
    #p arr
    0.upto(self.length - 1) do |i|
      result << []
      result[i] << self[i]

      arr.each do |a|
        unless a[i].nil?
          result[i] << a[i]
        else
          result[i] << nil
        end
      end

    end

    result

  end
  def my_rotate(num = 1)

    num_of_rotations = num % self.length

    count = num_of_rotations
    num_of_iterations = 0

    result = []
    rotate = false

    while rotate == false

      result << self[count]

      if count == self.length - 1
        count = 0
      else
        count += 1
      end

      num_of_iterations += 1

      rotate = true if num_of_iterations == self.length

    end

    result
  end
  def my_join(chr = "")
    result = ""
    for i in 0..self.length-1
      result << self[i]
      result << chr unless i == self.length-1
    end
    result
  end
  def my_reverse
    result = []
    (self.length-1).downto(0) do |i|
      result << self[i]
    end
    result
  end

end
