#include <thrust/device_vector.h>
#include <thrust/host_vector.h>
#include <thrust/generate.h>
#include <thrust/sort.h>
#include <thrust/binary_search.h>
#include <thrust/iterator/counting_iterator.h>
#include <thrust/random.h>

#include <iostream>
#include <iomanip>

// define a 2d float vector
typedef thrust::tuple<float,float> vec2;

// return a random vec2 in [0,1)^2
vec2 make_random_vec2(void)
{
  static thrust::default_random_engine rng;
  static thrust::uniform_real_distribution<float> u01(0.0f, 1.0f);
  float x = u01(rng);
  float y = u01(rng);
  return vec2(x,y);
}

int main()
{
  std::cout <<vec2 make_random_vec2() << std::endl;
}
