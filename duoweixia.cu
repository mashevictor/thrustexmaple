#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <thrust/copy.h>
#include <thrust/fill.h>
#include <thrust/sequence.h>
#include <iostream>

int main(void)
{
  // 初始化device_vector D，包含10个1
  thrust::device_vector<int> D(10, 100);                                  // 1 1 1 1 1 1 1 1 1 1 

  // 将D的前7个元素设为9
  thrust::fill(D.begin(), D.begin() + 7,99);                               // 9 9 9 9 9 9 9 1 1 1

  // 利用D的前5个元素初始化host_vector H
  thrust::host_vector<int> H(D.begin(), D.begin() + 5);          // 9 9 9 9 9 

  // 将H的元素设为 0, 1, 2, 3, ...
  thrust::sequence(H.begin(), H.end());     
  for(int i = 0; i < H.size(); i++)
  {
    std::cout << "wocaH[" << i << "] = " << H[i] << std::endl;            // 0 1 2 3 4 9 9 1 1 1
  }                            // 0 1 2 3 4

  // 将H复制到D
  thrust::copy(H.begin(), H.end(), D.begin());                         // 0 1 2 3 4 9 9 1 1 1

  // 输出 D
  for(int i = 0; i < D.size(); i++)
  {
    std::cout << "D[" << i << "] = " << D[i] << std::endl;            // 0 1 2 3 4 9 9 1 1 1
  }

  return 0;
}
