fun get_nth (xs, n) =
  let
      fun get_nth_iter (xs, n, counter) =
        case xs of
            [] => "none"
          | x::xs' => if n=counter
                     then x
                     else get_nth_iter (xs', n, counter+1)
  in
      get_nth_iter (xs, n, 1)
  end;

fun date_to_string (year, month, day) =
  let
      val month_str = ["January", "February", "March", "April",
                       "May", "June", "July", "August",
                       "September", "October", "November", "December"];
  in
      get_nth (month_str, month)
      ^ " "
      ^ Int.toString(day)
      ^ ", "
      ^ Int.toString(year)
  end;

val date = (2016, 9, 20);
val s = date_to_string date;
