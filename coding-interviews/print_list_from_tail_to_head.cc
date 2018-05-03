/*
 * 题目描述：
 * 输入一个链表，从尾到头打印链表每个节点的值。
 *
 * 解题思路：
 *
 */
#include <vector>

using std::vector;

struct ListNode {
    int val;
    struct ListNode *next;
    ListNode(int x): val(x), next(nullptr) {}
};

class Solution {
public:
    vector<int> printListFromTailToHead(ListNode* head) {
        vector<int> ret;

        vector<int> tmp;
        ListNode *p = head;
        while (p != nullptr) {
            tmp.push_back(p->val);
            p = p->next;
        }

        for (auto iter = tmp.rbegin(); iter != tmp.rend(); ++iter) {
            ret.push_back(*iter);
        }

        return ret;
    }
};

