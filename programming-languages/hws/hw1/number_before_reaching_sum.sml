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
        then index-2
        else calculate_to_index (xs, index+1, produce+get_nth(xs, index))
  in
      calculate_to_index (xs, 1, 0)
  end;

val a = [1, 2, 3, 4, 5, 6];
val b = number_before_reaching_sum (a, 15);
val c = number_before_reaching_sum (a, 14);
val b = number_before_reaching_sum (a, 16);
val b = number_before_reaching_sum (a, 20);
