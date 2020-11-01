#include <stdio.h>
#include <stdlib.h>

/* Т.к. C не позволяет легко положить массив прямо
   в стек без указания его размера как константы,
   то нужно использовать передачу по ссылке.
   Двумерный массив можно реализовать как элементы
   одномерного построчно, поэтому сама функция оперирует
   уже одномерным, а произведение его размерностей
   передается как один размер */
size_t find_index(int val, int *arr, size_t n) {
  for (size_t i = 0; i < n; ++i) {
    if (arr[i] == val)
      return i;
  }
  return n;
}

struct Size2 {
  size_t i;
  size_t j;
};

/* Т.к. C не позволяет легко положить массив прямо
   в стек без указания его размера как константы,
   то нужно использовать передачу по ссылке.
   Для получения двумерного индекса можно применить
   всего 3 дополнительных операции:
   умножение размерностей массива и
   деление с остатком индекса на размерность строки
   (последнее -- 2 операции в C и в RISC-V) */
struct Size2 find_index2(int val, int *arr, size_t n, size_t m) {
  size_t index = find_index(val, arr, n * m);
  struct Size2 result;
  result.j = index % n;
  result.i = index / n;
};

#define N 3
#define M 6

int main() {
  int arr[N * M];
  for (size_t i = 0; i < M; ++i)
  for (size_t j = 0; j < N; ++j)
    arr[i * N + j] = 256 * i + j;
  struct Size2 pos = find_index2(0x0502, arr, N, M);
  printf("%d %d\n", pos.i, pos.j);
  return 0;
}
