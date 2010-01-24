# http://en.wikipedia.org/wiki/Euclidean_distance
module DistanceMeasures
  def euclidean_distance(other)
    sum = 0.0
    self.each_index do |i|
      sum += (self[i] - other[i])**2
    end
    Math.sqrt(sum)
  end
end