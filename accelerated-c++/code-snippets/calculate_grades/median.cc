#include "median.h"

#include <algorithm>
#include <stdexcept>

using std::vector;
using std::domain_error;
using std::sort;

/*
  compute the median of a vector<double>
  note that calling this function copies the entire argument vector
*/
double median(vector<double> vec) {
    typedef vector<double>::size_type vec_sz;

    vec_sz size = vec.size();
    if (size == 0) {
        throw domain_error("median of an empty vector");
    }

    // sort the vector
    sort(vec.begin(), vec.end());

    vec_sz mid = size / 2;

    return (size % 2 == 0) ? (vec[mid] + vec[mid-1]) / 2 : vec[mid];
}
