exception MyUndesirableCondition;
exception MyOtherException of int * int;

fun mydiv (x, y) =
  if y=0
  then raise MyUndesirableCondition
  else x div y;

fun maxlist (xs, ex) =
  case xs of
      [] => raise ex
    | x::[] => x
    | x::xs' => Int.max(x, maxlist(xs', ex));

val w = maxlist ([2, 34, 5], MyUndesirableCondition);

val v = maxlist ([], MyUndesirableCondition)
        handle MyUndesirableCondition => 42;
