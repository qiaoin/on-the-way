fun sorted3 x y z = z >= y andalso y >= x;

fun fold f acc xs =
  case xs of
      [] => acc
    | x::xs' => fold f (f(acc, x)) xs';

val is_nonnegative = sorted3 0 0;

val sum = fold (fn (x, y) => x + y) 0;

(* range from i to j inclusive *)
fun range i j =
  if i > j
  then []
  else i :: range (i+1) j;

(* return a function, count from 1 to that argument *)
val countup = range 1;

fun exists predicate xs =
  case xs of
      [] => false
    | x::xs' => predicate x orelse exists predicate xs';

val no = exists (fn x => x = 7) [4, 11, 12];

val hasZero = exists (fn x => x = 0);

val incrementAll = List.map (fn x => x + 1);

val removeZeros = List.filter (fn x => x <> 0);

(* 'a list -> ('a * int) list, may across warnings *)
val pairWithOne = List.map (fn x => (x, 1));

(* work around *)
fun pairWithOne xs = List.map (fn x => (x, 1)) xs;

val pairWithOne : string list -> (string * int) list =
    List.map (fn x => (x, 1));

(* this function works fine because result is not polymorphic *)
val incrementAndPairWithOne = List.map (fn x => (x+1, 1));
