# http://en.wikipedia.org/wiki/Jaccard_index#Tanimoto_coefficient_.28extended_Jaccard_coefficient.29
module DistanceMeasures
  def tanimoto_coefficient(other)
    dot = self.dot_product(other).to_f
    result = dot / (self.sum_of_squares + other.sum_of_squares - dot).to_f
    
    handle_nan(result)
  end
end