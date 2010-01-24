# http://en.wikipedia.org/wiki/Jaccard_coefficient
module DistanceMeasures
  
  def jaccard_distance(other)
    1 - self.jaccard_index(other)
  end
  
  def jaccard_index(other)
    union = (self + other).uniq.size.to_f
    intersection = self.intersection_with(other).size.to_f
        
    intersection / union
  end
  
  def binary_jaccard_distance(other)
    1 - self.binary_jaccard_index(other)
  end
  
  def binary_jaccard_index(other)
    intersection = self.binary_intersection_with(other).delete_if {|x| x == 0}.size.to_f
    union = self.binary_union_with(other).delete_if {|x| x == 0}.size.to_f
    
    intersection / union
  end
  
end