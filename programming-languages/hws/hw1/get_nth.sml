fun get_nth (xs, n) =
  let
      fun get_nth_iter (xs, n, counter) =
        (* 'a list -> 'a *)
        case xs of
          x::xs' => if n=counter
                   then x
                   else get_nth_iter (xs', n, counter+1)
         | [] => raise List.Empty
          (* in this position,  *)
  in
      get_nth_iter (xs, n, 1)
  end;

val str_list = ["abc", "def", "ghi", "jkl", "mn"];
val first = get_nth (str_list, 1);
val second = get_nth (str_list, 2);
val third = get_nth (str_list, 3);
val fourth = get_nth (str_list, 4);
