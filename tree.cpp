#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct Node {
  Node* left, *right;
  int val;
  Node(int val) : val(val), left(), right() {}
  ~Node() {
    if (left) delete left;
    if (right) delete right;
  }

  void insert(int x) {
    if (val == x) return;
    if (val > x) {
      if (left) left->insert(x);
      else left = new Node(x);
    } else if (right) right->insert(x);
    else right = new Node(x);
  }

  void display() {
    if (left) left->display();
    printf("%d ", val);
    if (right) right->display();
  }

  int count() {
    int count = 1;
    if (left) count += left->count();
    if (right) count += right->count();
    return count;
  }
};

int main() {
  Node n = 0;
  for(int i = 0; i < 1000000; ++i) {
    n.insert(rand() % 1000000);
  }
  //n.display();
  printf("%d\n", n.count());
}