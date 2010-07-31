#include <ruby.h>
#include <math.h>

// Prototypes
long c_array_size(VALUE array);

/*

def dot_product(other)
  sum = 0.0
  self.each_with_index do |n, index|
    sum += n * other[index]
  end

  sum
end

*/
static VALUE rb_dot_product(VALUE self, VALUE other_array) {
  double sum = 0;

  //TODO: check they're the same size
  long array_size = c_array_size(self);
  int index;

  for(index = 0; index <= array_size; index++) {
    double x, y;

    x = NUM2DBL(RARRAY(self)->ptr[index]);
    y = NUM2DBL(RARRAY(other_array)->ptr[index]);

    sum += x * y;
  }

  return rb_float_new(sum);
}

/*

def sum_of_squares
  inject(0) {|sum, n| sum + n ** 2}
end

*/
static VALUE rb_sum_of_squares(VALUE self) {
  double sum = 0;
  double array_size = c_array_size(self);
  int index;

  for(index = 0; index <= array_size; index++) {
    double x;

    x = NUM2DBL(RARRAY(self)->ptr[index]);

    sum += pow(x, 2);
  }

  return rb_float_new(sum);
}

// return the size of a Ruby array
long c_array_size(VALUE array) {
  return (RARRAY(array)->len - 1);
}

void Init_core() {
  VALUE distance_measures = rb_define_module("DistanceMeasures");
  rb_define_method(distance_measures, "dot_product", rb_dot_product, 1);
  rb_define_method(distance_measures, "sum_of_squares", rb_sum_of_squares, 0);
}