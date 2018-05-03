/*
 * 题目描述：
 *   输入某二叉树的前序遍历和中序遍历的结果，请重建出该二叉树。
 *   假设输入的前序遍历和中序遍历的结果中都不含重复的数字。
 *   例如输入前序遍历序列{1,2,4,7,3,5,6,8}和中序遍历序列{4,7,2,1,5,3,8,6}，则重建二叉树并返回。
 *
 * 解题思路：
 *   根据前序、中序重构树，前序用于确定根
 */
#include <iostream>
#include <vector>
#include <algorithm>

using std::cout;
using std::endl;
using std::vector;
using std::find;

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 };

class Solution {
public:
    TreeNode* reConstructBinaryTree(vector<int> pre, vector<int> vin) {
        if (pre.empty() || vin.empty()) {
            return nullptr;
        }
        TreeNode* root = new TreeNode(pre[0]);

        auto iter = find(vin.begin(), vin.end(), pre[0]);
        vector<int> left_vin(vin.begin(), iter);
        vector<int> right_vin(iter + 1, vin.end());
        vector<int> left_pre(pre.begin() + 1, pre.begin() + left_vin.size() + 1);
        vector<int> right_pre(pre.begin() + left_vin.size() + 1, pre.end());
        root->left = reConstructBinaryTree(left_pre, left_vin);
        root->right = reConstructBinaryTree(right_pre, right_vin);

        return root;
    }
};

int main() {
    vector<int> pre = {1, 2, 4, 7, 3, 5, 6, 8};
    vector<int> vin = {4, 7, 2, 1, 5, 3, 8, 6};
    Solution s;
    s.reConstructBinaryTree(pre, vin);

    return 0;
}
