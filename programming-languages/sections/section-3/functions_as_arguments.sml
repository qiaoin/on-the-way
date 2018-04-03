fun increment_n_times_lame (n, x) =
  if n=0
  then x
  else 1 + increment_n_times_lame (n-1, x);

fun double_n_times_lame (n, x) =
  if n=0
  then x
  else 2 * double_n_times_lame (n-1, x);

fun nth_tail_lame (n, xs) =
  if n=0
  then xs
  else tl (nth_tail_lame(n-1, xs));

(* all in one function *)
fun n_times_lame (n, x, apply) =
  if n=0
  then x
  else apply(n_times_lame(n-1, x, apply));

fun inc x = x + 1;

fun double x = 2 * x;

fun increment_n_times_lame_2 (n, x) =
  n_times_lame(n, x, inc);

fun double_n_times_lame_2 (n, x) =
  n_times_lame(n, x, double);

fun nth_tail_lame (n, x) =
  n_times_lame(n, x, tl);

fun addition (n, x) =
  n_times_lame(n, x, (fn y => y+1));

fun multi_two (n, x) =
  n_times_lame(n, x, (fn y => 2*y));

fun nth_tail (n, x) =
  n_times_lame(n, x, tl)
