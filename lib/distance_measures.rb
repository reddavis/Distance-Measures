$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'distance_measures/cosine_similarity'
require 'distance_measures/euclidean_distance'
require 'distance_measures/tanimoto_coefficient'
require 'distance_measures/core'
require 'distance_measures/jaccard'

class Array
  include DistanceMeasures
end