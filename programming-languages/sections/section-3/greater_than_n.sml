fun filter (f, xs) =
  case xs of
      [] => []
    | x::xs' => if f x
               then x::(filter (f, xs'))
               else filter (f, xs');

fun allGreaterThanSeven xs = filter (fn x => x > 7, xs);

fun allGreaterThan (xs, n) = filter (fn x => x > n, xs);

val x = [13, 4, 23, 14, 5, 7, 10];

val a = allGreaterThanSeven(x);

val b = allGreaterThan(x, 10);

fun allShorterThan1 (xs, s) =
  filter (fn x => String.size x < (print "!"; String.size s), xs);

fun allShorterThan2 (xs, s) =
  let
      val i = (print "!"; String.size s)
  in
      filter (fn x => String.size x < i, xs)
  end;

val _ = print "\n withAllShorterThan1: ";

val x1 = allShorterThan1(["1", "333", "22", "4444"], "xxx");

val _ = print "\nwithAllShorterThan2: ";

val x2 = allShorterThan2(["1", "333", "22", "4444"], "xxx");

val _ = print "\n";
