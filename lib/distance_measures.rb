$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'distance_measures/cosine_similarity'
require 'distance_measures/euclidean_distance'
require 'distance_measures/tanimoto_coefficient'
require 'distance_measures/core'
require 'distance_measures/jaccard'

class Array
  include DistanceMeasures

  def euclidean_normalize
    sum = 0.0
    self.each do |n|
      sum += n ** 2
    end

    Math.sqrt(sum)
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

  private

  # Checks if we're dealing with NaN's and will return 0.0 unless
  # handle NaN's is set to false
  def handle_nan(result)
    result.nan? ? 0.0 : result
  end
end