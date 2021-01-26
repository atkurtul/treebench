package main

	
import (
	"fmt"
	"math/rand"
)

type Node struct {
	left, right *Node
	val int
}

func insert(node **Node, val int) {
	var n = *node;
	if n == nil {
		*node = new(Node);
		(*node).val = val;
		return
	}
	if n.val == val {
		return;
	}
  if n.val > val {
    insert(&n.left, val);
  } else {
    insert(&n.right, val);
  }
}


func display(n *Node) {
  if n == nil {  return; }
  display(n.left);
  fmt.Printf("%d ", n.val);
  display(n.right);
}

func count(n *Node) int {
	if n == nil { return 0; }
	return count(n.left) + count(n.right) + 1;
}

func main() {
	var n  *Node = nil;
	for i:=0; i < 1000000; i+=1 {
		insert(&n, rand.Intn(1000000))
	}
	fmt.Printf("%d\n", count(n));
}
