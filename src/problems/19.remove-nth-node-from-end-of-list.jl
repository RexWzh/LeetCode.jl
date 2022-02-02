# ---
# title: 19. Remove Nth Node From End of List
# id: problem19
# author: zhwang
# date: 2022-01-23
# difficulty: Medium
# categories: Linked List, Two Pointers
# link: <https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/>
# hidden: true
# ---
# 
# Given the `head` of a linked list, remove the `nth` node from the end of the
# list and return its head.
# 
# **Follow up:**  Could you do this in one pass?
# 
# 
# 
# **Example 1:**
# 
# ![](https://assets.leetcode.com/uploads/2020/10/03/remove_ex1.jpg)
# 
#     
#     
#     Input: head = [1,2,3,4,5], n = 2
#     Output: [1,2,3,5]
#     
# 
# **Example 2:**
# 
#     
#     
#     Input: head = [1], n = 1
#     Output: []
#     
# 
# **Example 3:**
# 
#     
#     
#     Input: head = [1,2], n = 1
#     Output: [1]
#     
# 
# 
# 
# **Constraints:**
# 
#   * The number of nodes in the list is `sz`.
#   * `1 <= sz <= 30`
#   * `0 <= Node.val <= 100`
#   * `1 <= n <= sz`
# 
# 
## @lc code=start
using LeetCode

## methods 1
function remove_nth_from_end(head::ListNode, n::Int)::Union{Nothing,ListNode}
    len, node = 0, head
    while !isnothing(node)
        len += 1
        node = next(node)
    end
    len == n && return head.next
    ## node 1 move to node len - n, the n + 1 th from the end
    node = head
    for _ in 1:(len - n - 1)
        node = node.next
    end
    node.next = node.next.next
    return head
end

## methods 2-Double Pointers
function remove_nth_from_end_by_double_pointers(
    head::ListNode, n::Int
)::Union{Nothing,ListNode}
    p1, p2, dist = head, head, 0
    while !isnothing(p2)
        if dist <= n
            p2 = next(p2)
            dist += 1
        else
            p1 = next(p1)
            p2 = next(p2)
        end
    end
    dist == n && return next(head)
    p1.next = p1.next.next
    return head
end
## @lc code=end
