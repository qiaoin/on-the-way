/*
 * 题目描述：
 * 请实现一个函数，将一个字符串中的空格替换成“%20”。例如，当字符串为
 * “We Are Happy”.则经过替换之后的字符串为“We%20Are%20Happy”。
 *
 * 解题思路：
 * 
 */

class Solution {
public:
    void replaceSpace(char *str, int length) {
        if (str == nullptr || length <= 0) {
            return;
        }
        // 扫描一遍，得出所有的空格数，和字符串长度
        int count = 0;
        int original_len = 0;
        int i = 0;
        while (str[i] != '\0') {
            if (str[i] == ' ') {
                count++;
            }
            original_len++;
            i++;
        }

        int new_len = original_len + count * 2;
        if (new_len + 1 > length) {
            return;
        }

        int new_index = new_len;
        int original_index = original_len;
        while (original_index >= 0 && new_index > original_index) {
            if (str[original_index] == ' ') {
                str[new_index--] = '0';
                str[new_index--] = '2';
                str[new_index--] = '%';
            } else {
                str[new_index--] = str[original_index];
            }
            original_index--;
        }
    }
};
