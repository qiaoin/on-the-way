use "what_month.sml";

fun range (start, stop, step) =
  if start > stop
  then []
  else start :: range (start+step, stop, step);

fun month_range (day1, day2) =
  let
      val begin = what_month day1
      val stop   = what_month day2
  in
    range (begin, stop, 1)
  end;

val r = month_range (33, 129);
