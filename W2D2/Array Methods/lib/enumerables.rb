class Array
  def my_uniq
    result = []
    self.each do |el|
      unless result.include? el
        result << el
      end
    end
    result
  end

  def two_sum
    result = []
    self.each_with_index do |el, i|
      self.each_with_index do |el2, j|
          result << [i,j] if self[i] + self[j] == 0 && i != j && j > i
      end
    end
    result
  end

  def my_transpose
    result = Array.new(self[0].length) {Array.new(self.length)}
    for i in 0..self.length-1
      for j in 0..self[0].length-1
        result[j][i] = self[i][j]
      end
    end
    result
  end

  def stock_picker
    result = []

    for i in 0...length
      for j in 1...length
        if result.empty?
          result = [i, j]
        elsif self[j] - self[i] > self[result[1]] - self[result[0]]
          result = [i, j]
        end
      end
    end
    result
  end

end
