
open Format
open Random
open Array

type tree = 
  | Nil 
  | Node of int * tree ref * tree ref

let rec insert a b = 
  match a with
    | Nil -> Node(b, ref Nil, ref Nil)
    | Node (x, l, r) -> 
      if x == b
      then Node(x, l, r)
      else if x > b 
        then Node(x, ref (insert !l b), r) 
        else Node(x, l, ref (insert !r b))


let rec insert_mut a b = 
  match !a with
    | Nil -> a := Node(b, ref Nil, ref Nil)
    | Node (x, l, r) -> 
      if x == b
      then ()
       else if x > b 
        then insert_mut l b
        else insert_mut r b
  
let rec count node = 
  match !node with
  | Nil -> 0
  | Node(x, l, r) ->  count l + count r + 1

let upper = 1000000

let root = ref Nil

let _ = for _ = 0 to upper do
  insert_mut root (Random.int upper)
  done

let _ = printf "%d\n" (count root)


let rec init_node a b =
  if b > 0
    then init_node (insert a (Random.int upper)) (b - 1)
    else (insert a (Random.int upper))

let rec fold f a l =
    match l with
    []->a
    | h::t->fold f (f a h) t

let rec display node = 
  match !node with
  | Nil -> ()
  | Node(x, l, r) ->
    display l;
    printf "%d " x;
    display r