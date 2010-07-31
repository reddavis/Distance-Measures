#include <ruby.h>
#include <math.h>

static VALUE rb_euclidean_distance(VALUE self, VALUE other_array) {
  double value = 0.0;

  long vector_length = (RARRAY(self)->len - 1); // Both should be the same - TODO check!
  int index;

  for(index = 0; index <= vector_length; index++) {
    double x, y;

    x = NUM2DBL(RARRAY(self)->ptr[index]);
    y = NUM2DBL(RARRAY(other_array)->ptr[index]);

    value += pow(x - y, 2);
  }

  return rb_float_new(sqrt(value));
}

void Init_euclidean_distance() {
  VALUE distance_measures = rb_define_module("DistanceMeasures");
  rb_define_method(distance_measures, "euclidean_distance", rb_euclidean_distance, 1);
}