use "get_nth.sml";

fun range (start, stop, step) =
  if start > stop
  then []
  else start :: range (start+step, stop, step);

val month_num = range(1, 12, 1);

fun is_leap_year year =
  year mod 400 = 0 orelse (year mod 4 = 0 andalso year mod 100 <> 0);

fun in_that_list (xs : int list, num : int) =
  case xs of
      [] => false
    | x::xs' => num=x orelse in_that_list(xs', num);

fun is_reasonable (month, day, each_month_days) =
  let
      val days_in_month = get_nth (each_month_days, month)
  in
      in_that_list(month_num, month) andalso (day >= 1 andalso day <= days_in_month)
  end;

fun reasonable_date (year, month, day)  =
  if year <= 0
  then false
  else if is_leap_year year
  then (* leap year *)
      is_reasonable (month, day, [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31])
  else (* not leap year *)
      is_reasonable (month, day, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]);

val date1 = (2000, 1, 32);
val date2 = (1996, 2, 29);
val date3 = (1995, 2, 28);
val date4 = (2016, 9, 20);

val a = reasonable_date(date1);
val b = reasonable_date(date2);
val c = reasonable_date(date3);
val d = reasonable_date(date4);
