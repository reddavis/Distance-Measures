#include <ruby.h>
#include <math.h>

static VALUE rb_dot_product(VALUE self, VALUE other_array) {
  double sum = 0;

  //TODO: check they're the same size
  long array_size = (RARRAY(self)->len - 1);
  int index;

  for(index = 0; index <= array_size; index++) {
    double x, y;

    x = NUM2DBL(RARRAY(self)->ptr[index]);
    y = NUM2DBL(RARRAY(other_array)->ptr[index]);

    sum += x * y;
  }

  return rb_float_new(sum);
}

void Init_core() {
  VALUE distance_measures = rb_define_module("DistanceMeasures");
  rb_define_method(distance_measures, "dot_product", rb_dot_product, 1);
}