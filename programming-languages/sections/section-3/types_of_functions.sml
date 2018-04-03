fun times_until_zero (f, x) =
  if x=0
  then 0
  else 1 + times_until_zero(f, f x);

(* note: a better implementation would be tail-recursive *)
fun times_until_zero_tail (f, x, acc) =
  if x=0
  then acc
  else times_until_zero_tail (f, f x, acc+1);

fun len xs =
  case xs of
      [] => 0
    | _::xs' => 1 + len xs';
