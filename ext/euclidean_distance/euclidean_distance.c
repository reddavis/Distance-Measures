#include <ruby.h>
#include <math.h>
#include "../19_fix/19_fix.c"

/*

def euclidean_distance(other)
  sum = 0.0
  self.each_index do |i|
    sum += (self[i] - other[i])**2
  end
  Math.sqrt(sum)
end

*/
static VALUE rb_euclidean_distance(VALUE self, VALUE other_array) {
  double value = 0.0;

  //TODO: check they're the same size
  long vector_length = (RARRAY_LEN(self) - 1);
  int index;

  for(index = 0; index <= vector_length; index++) {
    double x, y;

    x = NUM2DBL(RARRAY_PTR(self)[index]);
    y = NUM2DBL(RARRAY_PTR(other_array)[index]);

    value += pow(x - y, 2);
  }

  return rb_float_new(sqrt(value));
}

void Init_euclidean_distance() {
  VALUE distance_measures = rb_define_module("DistanceMeasures");
  rb_define_method(distance_measures, "euclidean_distance", rb_euclidean_distance, 1);
}