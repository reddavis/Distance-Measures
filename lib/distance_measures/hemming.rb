# https://en.wikipedia.org/wiki/Hamming_distancemodule
module DistanceMeasures

	def hemming_xor_distance(other)
		self.zip(other).reduce(0){|sum, val| sum + (val[0] == val[1] ? 0 : 1)}
	end
end


