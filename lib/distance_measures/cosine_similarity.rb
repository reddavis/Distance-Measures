module DistanceMeasures
  def cosine_similarity(other)
    dot_product = self.dot_product(other)
    normalization = self.euclidean_normalize * other.euclidean_normalize

    handle_nan(dot_product / normalization)
  end
end