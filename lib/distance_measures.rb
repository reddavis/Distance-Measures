$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'distance_measures/cosine_similarity'
require 'distance_measures/euclidean_distance'
require 'distance_measures/tanimoto_coefficient'
require 'distance_measures/core'
require 'distance_measures/jaccard'
require 'distance_measures/haversine'
require 'distance_measures/hemming'
require 'distance_measures/jensen_shannon'

module MetricObject

  def calc_distance(other, measure = nil, &distance)
    if distance
      yield self.coords, other.coords
    else
      if measure
        # it performs many str cmp =(
        self.coords.send(measure, other.coords)
      else
        throw "No metric"
      end
    end
  end
  
end

class Array
  include DistanceMeasures
  include MetricObject

  # http://en.wikipedia.org/wiki/Intersection_(set_theory)
  def intersection_with(other)
    (self & other)
  end

  # http://en.wikipedia.org/wiki/Union_(set_theory)
  def union_with(other)
    (self + other).uniq
  end

  private

  # Checks if we're dealing with NaN's and will return 0.0 unless
  # handle NaN's is set to false
  def handle_nan(result)
    result.nan? ? 0.0 : result
  end
end

