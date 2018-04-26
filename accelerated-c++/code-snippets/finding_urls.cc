#include <string>
#include <vector>
#include <algorithm>
#include <cctype>

using std::string;
using std::vector;
using std::find;
using std::find_if;
using std::search;

// return true when passed a character that cannot be in a URL
bool not_url_char(char c) {
    // characters, in addition to alphanumerics, that can appear in a URL
    static const string url_ch = "~;/?:@=&$-_.+!*'(),";

    // see whether c can appear in a URL and return the negative
    return !(isalnum(c) ||
             find(url_ch.begin(), url_ch.end(), c) != url_ch.end());
}

/*
  url_beg:
    identify whether a valid URL is present
    - if so, for returning an iterator that refers to the first
    character of the protocol-name;
    - if it does not identify a URL in the input, then it will
    return its second argument to indicate failure
 */
string::const_iterator
url_beg(string::const_iterator b, string::const_iterator e) {
    static const string sep = "://";
    typedef string::const_iterator iter;

    // it marks where the separator was found
    iter i = b;

    while ((i = search(i, e, sep.begin(), sep.end())) != e) {
        // make sure the separator isn't at the beginning or end of the line
        if (i != b && (i + sep.size() != e)) {
            // beg marks the beginning of the protocol name
            iter beg = i;
            while (beg != b && isalpha(beg[-1])) {
                --beg;
            }

            // is there at least one appropriate character before and after the separator
            if (beg != i && !not_url_char(i[sep.size()])) {
                return beg;
            }
        }

        // the separator we found wasn't part of a URL, advance i past this separator
        i += sep.size();
    }
    return e;
}

/*
  url_end:
    find the end of the URL, search from the given position until
    - it reaches either the end of the input or a character that cannot
    be part of a URL;
    - return an iterator positioned one past the last character in the URL
 */
string::const_iterator
url_end(string::const_iterator b, string::const_iterator e) {
    return find_if(b, e, not_url_char);
}

vector<string> find_urls(const string& s) {
    vector<string> ret;
    typedef string::const_iterator iter;
    iter b = s.begin();
    iter e = s.end();

    // look through the entire input
    while (b != e) {
        // look for one or more letters follows by ://
        b = url_beg(b, e);

        // if we found it
        if (b != e) {
            // get the rest of the URL
            iter after = url_end(b, e);

            // remember the URL
            ret.push_back(string(b, after));

            // advance b and check for more URLs on this line
            b = after;
        }
    }

    return ret;
}
