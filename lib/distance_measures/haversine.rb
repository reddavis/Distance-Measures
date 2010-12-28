# 
# Notes:
#
# translated into Ruby based on information contained in:
#   http://mathforum.org/library/drmath/view/51879.html  Doctors Rick and Peterson - 4/20/99
#   http://www.movable-type.co.uk/scripts/latlong.html
#   http://en.wikipedia.org/wiki/Haversine_formula
#
# This formula can compute accurate distances between two points given latitude and longitude, even for 
# short distances.

module DistanceMeasures

  # PI = 3.1415926535
  RAD_PER_DEG = 0.017453293  #  PI/180

  R_MILES = 3956     # radius of the great circle in miles
  R_KM = 6371        # radius in kilometers...some algorithms use 6367
  
  # the great circle distance d will be in whatever units R is in
  R = {
    :miles => R_MILES,
    :km => R_KM,
    :feet => R_MILES * 5282,
    :meters => R_KM * 1000
  }

  def haversine_distance(other, um = :meters)
    dlon = other[1] - self[1]
    dlat = other[0] - self[0]

    dlon_rad = dlon * RAD_PER_DEG 
    dlat_rad = dlat * RAD_PER_DEG

    lat1_rad = self[0] * RAD_PER_DEG
    lon1_rad = self[1] * RAD_PER_DEG

    lat2_rad = other[0] * RAD_PER_DEG
    lon2_rad = other[1] * RAD_PER_DEG

    a = (Math.sin(dlat_rad/2))**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * (Math.sin(dlon_rad/2))**2
    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))

    R[um] * c
  end
end