
open Format
open Random
open Array

type tree = 
  | Nil 
  | Node of int * tree * tree

let rec insert a b = 
  match a with
    | Nil -> Node(b, Nil, Nil)
    | Node (x, l, r) -> 
      if x == b
      then Node(x, l, r)
      else if x > b 
        then Node(x, insert l b, r) 
        else Node(x, l, insert r b)

let upper = 1000000

let rec rooter a b =
  if b > 0
    then rooter (insert a (Random.int upper)) (b - 1)
    else (insert a (Random.int upper))

let rec fold f a l =
    match l with
    []->a
    | h::t->fold f (f a h) t
;;

let rec display node = 
  match node with
  | Nil -> ()
  | Node(x, l, r) ->
    display l;
    printf "%d " x;
    display r

let rec count node = 
  match node with
  | Nil -> 0
  | Node(x, l, r) ->  count l + count r + 1


(* let root = fold insert Nil arr *)
let root = rooter Nil upper
let _ = printf "%d\n" (count root)