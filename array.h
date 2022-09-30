#pragma once

extern "C" int* make_Array(int length);
extern "C" int get(int* base_pointer, int index);
extern "C" void change(int* base_pointer, int index, int value);
