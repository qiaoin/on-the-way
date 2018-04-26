#include <algorithm>
#include <iostream>
#include <vector>
#include <string>

using std::cin;
using std::cout;
using std::endl;
using std::max;
using std::string;
using std::vector;

string::size_type width(const vector<string>& v) {
    string::size_type maxlen = 0;
    for (vector<string>::const_iterator iter = v.begin();
         iter != v.end(); ++iter) {
        maxlen = max(maxlen, iter->size());
    }

    return maxlen;
}

vector<string> frame(const vector<string>& p) {
    vector<string> ret;
    string::size_type maxlen = width(p);
    string border(maxlen + 4, '*');

    // write the top border
    ret.push_back(border);

    // writen each interior row, bordered by an asterisk and a space
    for (vector<string>::size_type i = 0; i != p.size(); ++i) {
        ret.push_back("* " + p[i] + string(maxlen - p[i].size(), ' ') + " *");
    }

    // write the bottom border
    ret.push_back(border);

    return ret;
}

vector<string> vcat(const vector<string>& top, const vector<string>& bottom) {
    // copy the top picture
    vector<string> ret = top;

    // copy entire bottom picture
    for (vector<string>::const_iterator iter = bottom.begin();
         iter != bottom.end(); ++iter) {
        ret.push_back(*iter);
    }

    /* we can write */
    // ret.insert(ret.end(), bottom.begin(), bottom.end());
    // or
    // std::copy(bottom.begin(), bottom.end(), std::back_inserter(ret));

    return ret;
}

vector<string> hcat(const vector<string>& left, const vector<string>& right) {
    vector<string> ret;

    // add 1 to leave a space between pictures
    string::size_type width1 = width(left) + 1;

    // indices to look at elements from left and right respectively
    vector<string>::size_type i = 0, j = 0;

    // continue until we've seen all row from both pictures
    while (i != left.size() || j != right.size()) {
        // construct new string to hold characters from both pictures
        string s;

        // copy a row from the left-hand side, if there is one
        if (i != left.size()) {
            s = left[i++];
        }

        // pad to full width
        s + string(width1 - s.size(), ' ');

        // copy a row from the right-hand side, if there is one
        if (j != right.size()) {
            s += right[j++];
        }

        // add s to the picture we're creating
        ret.push_back(s);
    }

    return ret;
}
