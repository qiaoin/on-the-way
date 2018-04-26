#include "Student_info.h"
#include "grade.h"
#include "median.h"

#include <list>
#include <algorithm>

using std::istream;
using std::ostream;
using std::endl;
using std::string;
using std::vector;
using std::list;
using std::find;
using std::transform;
using std::back_inserter;
using std::domain_error;
using std::remove_copy_if;
using std::stable_partition;

bool compare(const Student_info& x, const Student_info& y) {
    return x.name < y.name;
}

istream& read(istream& is, Student_info& s) {
    // read and store the student's name and midterm and final exam grades
    is >> s.name >> s.midterm >> s.finalterm;

    read_hw(is, s.homework); // read and store all the student's homework grades

    return is;
}

// read homework grades from an input stream into a vector<double>
istream& read_hw(istream& in, vector<double>& hw) {
    if (in) {
        // get rid of previous contents
        hw.clear();

        // read homework grades
        double x;
        while (in >> x) {
            hw.push_back(x);
        }

        // clear the stream so that input will work for the next student
        in.clear();
    }

    return in;
}

// predicate to determine whether a student failed
bool fgrade(const Student_info& s) {
    return grade(s) < 60;
}

bool pgrade(const Student_info& s) {
    return !fgrade(s);
}

// separate passing and failing student records: first try
list<Student_info> extract_fails(list<Student_info>& students) {
    list<Student_info> fail;
    list<Student_info>::iterator iter = students.begin();

    while (iter != students.end()) {
        if (fgrade(*iter)) {
            fail.push_back(*iter);
            iter = students.erase(iter);
        } else {
            ++iter;
        }
    }

    return fail;
}

vector<Student_info>
extract_fails2(vector<Student_info>& students) {
    vector<Student_info> fail;
    remove_copy_if(students.begin(), students.end(),
                   back_inserter(fail), pgrade);
    students.erase(remove_if(students.begin(), students.end(), fgrade),
                   students.end());
    return fail;
}

vector<Student_info>
extract_fails3(vector<Student_info>& students) {
    vector<Student_info>::iterator iter =
        stable_partition(students.begin(), students.end(), pgrade);
    vector<Student_info> fail(iter, students.end());
    students.erase(iter, students.end());

    return fail;
}

bool did_all_hw(const Student_info& s) {
    return ((find(s.homework.begin(), s.homework.end(), 0)) != s.homework.end());
}

double median_analysis(const vector<Student_info>& students) {
    vector<double> grades;

    transform(students.begin(), students.end(),
              back_inserter(grades), grade_aux);

    return median(grades);
}

double average_analysis(const std::vector<Student_info>& students) {
    vector<double> grades;

    transform(students.begin(), students.end(),
              back_inserter(grades), average_grade);

    return median(grades);
}

double optimistic_median_analysis(const std::vector<Student_info>& students) {
    vector<double> grades;

    transform(students.begin(), students.end(),
              back_inserter(grades), optimistic_median);

    return median(grades);
}

void write_analysis(ostream& out, const string& name,
                    double analysis(const vector<Student_info>&),
                    const vector<Student_info>& did,
                    const vector<Student_info>& didnt) {
    out << name << ": median(did) = " << analysis(did) <<
        ", median(didnt) = " << analysis(didnt) << endl;
}

