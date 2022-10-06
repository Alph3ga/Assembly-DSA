#pragma once

#ifdef __cplusplus
extern "C"{
#endif
  int* make_Array(int length);
  int get(int* base_pointer, int index);
  void change(int* base_pointer, int index, int value);
#ifdef __cplusplus
}
#endif
