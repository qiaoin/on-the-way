fun get_nth (xs, n) =
  let
      fun get_nth_iter (xs, n, counter) =
        case xs of
          x::xs' => if n=counter
                     then x
                     else get_nth_iter (xs', n, counter+1)
  in
      get_nth_iter (xs, n, 1)
  end;

fun number_before_reaching_sum (xs, sum) =
  let
      fun calculate_to_index (xs, index, produce) =
        if produce >= sum
        then index - 1
        else calculate_to_index (xs, index+1, produce+get_nth(xs, index+1))
  in
      calculate_to_index (xs, 0, 0)
  end;

fun what_month x =
  let
      val each_month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  in
      number_before_reaching_sum (each_month_days, x) + 1
  end;

val second = what_month 33;
val five = what_month 129;
