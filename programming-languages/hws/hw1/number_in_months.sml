(*
    xs : (int * int * int) list, a list of dates
    month : an int
    number_in_month : date list * int -> int
          returns how many dates in the list are in the given month
*)
fun number_in_month (xs : (int*int*int) list, month : int) =
  case xs of
      [] => 0
    | (_, x, _) :: xs' => if x=month
                         then number_in_month (xs', month) + 1
                         else number_in_month (xs', month);

fun number_in_months (xs : (int*int*int) list, months : int list) =
  case months of
      [] => 0
    | month::months' => number_in_months(xs, months')
                       + number_in_month(xs, month);

val date1 = (2000, 1, 12);
val date2 = (1994, 7, 16);
val date3 = (1995, 4, 9);
val date4 = (2016, 9, 20);
val date5 = (1998, 7, 22);
val date6 = (2016, 7, 16);
val date7 = (1995, 4, 19);
val date8 = (2012, 7, 19);

val date_list = [date1, date2, date3, date4, date5, date6, date7, date8];
val month_list = [1, 3, 5, 7, 9];

val number = number_in_months (date_list, month_list);
