fun fact1 n =
  if n=0
  then 1
  else n * fact1(n-1);

val x = fact1 3;

fun fact2 n =
  let
      fun aux(n, acc) =
        if n=0
        then 1
        else aux(n-1, acc*n)
  in
      aux(n, 1)
  end;

val y = fact2 3;
