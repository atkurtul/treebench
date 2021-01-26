#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct node {
  struct node* left, *right;
  int val;
};

void insert(struct node** pn, int val) {
  struct node* n = *pn;
  if (!n) {
    *pn = calloc(1, sizeof(struct node));
    (*pn)->val = val;
    return;
  }
  if (n->val == val) return;
  if (n->val > val) {
    insert(&n->left, val);
  } else {
    insert(&n->right, val);
  }
}

void drop(struct node* n) {
  if(!n) return;
  drop(n->left);
  drop(n->right);
  free(n);
}

int count(struct node* n) {
  int re = n ? count(n->left) + count(n->right) + 1 : 0;
  free(n);
  return re;
}

void display(struct node* n) {
  if(!n) return;
  display(n->left);
  printf("%d ", n->val);
  display(n->right);
}

int main() {
  struct node* n = 0;
  for(int i = 0; i < 1000000; ++i) {
    insert(&n, rand() % 1000000);
  }
  printf("%d\n", count(n));
}