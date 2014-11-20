(* TASK1: remove the extra newline between the two cases
 * TASK2: switch the order of base and recursive cases
 * TASK3: insert 'rec' after let
 *)
let map (f : 'a -> 'b) : 'a list -> 'b list = function
  | hd :: tl -> (f hd) :: (map f tl)

  | [] -> []
