#include "grade.h"
#include "median.h"
#include "Student_info.h"

#include <stdexcept>
#include <vector>
#include <algorithm>
#include <numeric>

using std::vector;
using std::domain_error;
using std::accumulate;
using std::remove_copy;
using std::back_inserter;

double grade(double midterm, double finalterm, double homework) {
    return 0.2 * midterm + 0.4 * finalterm + 0.4 * homework;
}

/*
  compute a student's overall grade from midterm and final exam grades
  and vector of homework grades.
  this function does not copy its argument, because median does so for us.
*/
double grade(double midterm, double finalterm, const vector<double>& hw) {
    if (hw.size() == 0) {
        throw domain_error("student has done no homework");
    }

    return grade(midterm, finalterm, median(hw));
}

double grade(const Student_info& s) {
    return grade(s.midterm, s.finalterm, s.homework);
}

double grade_aux(const Student_info& s) {
    try {
        return grade(s);
    } catch (domain_error) {
        return grade(s.midterm, s.finalterm, 0);
    }
}

double average(const vector<double>& v) {
    return accumulate(v.begin(), v.end(), 0.0) / v.size();
}

double average_grade(const Student_info& s) {
    return grade(s.midterm, s.finalterm, average(s.homework));
}

double optimistic_median(const Student_info& s) {
    vector<double> nonzero;
    remove_copy(s.homework.begin(), s.homework.end(),
                back_inserter(nonzero), 0);

    if (nonzero.empty()) {
        return grade(s.midterm, s.finalterm, 0);
    } else {
        return grade(s.midterm, s.finalterm, median(nonzero));
    }
}

