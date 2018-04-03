#include <stdio.h>

int binarySearch(int a[], int left, int right, int target);

int main() {
  int a[10] = {12, 14, 18, 25, 45, 89, 134, 156, 234, 400};
  int target = 15;
  int position = binarySearch(a, 0, 9, target);
  printf("the position is : %d\n", position);
  return 0;
}

/*
 * 数组a按升序排列，即: a[0] <= a[1] <= ... <= a[n-1]
 */
int binarySearch(int a[], int left, int right, int target) {
  int mid = 0;
  while (left <= right) {
    mid = (left + right) / 2;
    if (target == a[mid]) {
      return mid;
    } else if (target < a[mid]) {
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }
  return -1;
}
