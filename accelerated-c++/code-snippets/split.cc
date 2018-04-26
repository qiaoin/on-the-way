#include <iostream>
#include <vector>
#include <string>
#include <cctype>
#include <algorithm>

using std::cin;
using std::cout;
using std::endl;
using std::vector;
using std::string;
using std::find_if;

vector<string> split(const string& s) {
    vector<string> ret;
    typedef string::size_type string_size;

    string_size i = 0;

    while (i != s.size()) {
        // ignore leading blanks
        while (i != s.size() && isspace(s[i])) {
            ++i;
        }

        // find end of next word
        string_size j = i;
        while (j != s.size() && !isspace(s[j])) {
            j++;
        }

        // if we found some non-whitespace characters
        if (i != j) {
            // copy from s starting at i and taking j - i chars
            ret.push_back(s.substr(i, j - i));
            i = j;
        }
    }

    return ret;
}

// true if the argument is whitespace, false otherwise
bool space(char c) {
    return isspace(c);
}

// false if the argument is whitespace, true otherwise
bool not_space(char c) {
    return !isspace(c);
}

vector<string> split2(const string& str) {
    typedef string::const_iterator iter;
    vector<string> ret;

    iter i = str.begin();
    while (i != str.end()) {
        // ignore leading blanks
        i = find_if(i, str.end(), not_space);

        // find end of next word
        iter j = find_if(i, str.end(),  space);

        // copy the characters in [i, j)
        if (i != str.end()) {
            ret.push_back(string(i, j));
        }
        i = j;
    }

    return ret;
}

int main() {
    string s;

    // read and split each line of input
    while (getline(cin, s)) {
        vector<string> v = split(s);

        // write each word in v
        for (vector<string>::size_type i = 0; i != v.size(); ++i) {
            cout << v[i] << endl;
        }
    }

    return 0;
}

