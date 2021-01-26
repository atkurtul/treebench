#[derive(Debug)]
pub enum Node {
  Nil,
  Some(i32, Box<Node>, Box<Node>),
}

impl Node {
  pub fn nil() -> Box<Node> {
    Box::new(Node::Nil)
  }

  pub fn insert(&mut self, val: i32) {
    match self {
        Node::Nil => {
          *self = Node::Some(val, Node::nil(), Node::nil());
        }
        Node::Some(x, l, r) => {
          if *x == val {
          } else if *x > val {
            l.insert(val);
          } else {
            r.insert(val);
          }
        }
    }
  }

  pub fn count(&self) -> i32 {
    match self {
      Node::Nil => 0,
      Node::Some(x, l, r) => l.count() + r.count() + 1,
    }
  }

}
extern "C" {
  fn rand() -> i32;
}

pub fn ran() -> i32 {
  unsafe { rand() }
}

fn main() {

  let mut root = Node::Nil;
  for _ in 0..1000000 {
    root.insert(ran() % 1000000);
  }

  println!("{}", root.count());
}
