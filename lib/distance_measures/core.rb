module DistanceMeasures
  def dot_product(other)
    sum = 0.0
    self.each_with_index do |n, index|
      sum += n * other[index]
    end
    
    sum
  end
  
  def euclidean_normalize
    sum = 0.0
    self.each do |n|
      sum += n ** 2
    end
    
    Math.sqrt(sum)
  end
  
  def sum_of_squares
    inject(0) {|sum, n| sum + n ** 2}
  end
  
  # http://en.wikipedia.org/wiki/Intersection_(set_theory)
  def intersection_with(other)
    (self & other)
  end
  
  # http://en.wikipedia.org/wiki/Union_(set_theory)
  def union_with(other)
    (self + other).uniq
  end
  
  # 1's & 0's
  def binary_intersection_with(other)
    intersects = []
    self.each_with_index do |n, index|
      if n == 1 && other[index] == 1
        intersects << 1
      else
        intersects << 0
      end
    end
    
    intersects
  end
  
  def binary_union_with(other)
    unions = []
    self.each_with_index do |n, index|
      if n == 1 || other[index] == 1
        unions << 1
      else
        unions << 0
      end
    end
    
    unions
  end
end