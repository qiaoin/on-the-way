(* define a help function that takes a int and return 1/0/~1 *)
fun symbol x = if x > 0 then 1 else if x < 0 then ~1 else 0;

(*
   date : int * int * int
   x : the year
   y : the month
   z : the day
   is_older : (int*int*int) * (int*int*int) -> bool
       It evaluates to true if the first argument is a date that comes
       before the second argument.
 *)
fun is_older ((x1, y1, z1), (x2, y2, z2)) =
  let
      val year_gap = symbol (x2 - x1)
      val month_gap = symbol (y2 - y1)
      val day_gap = symbol (z2 - z1)
      (*
         take care!
         In ML, the let expressions:
                 let b1 b2 ... in e end;
         we can use all the earlier bindings for the later ones, and we
         can use them all for e.
      => the *scope* of a binding in a let expression is the later bindings
         in that let expression and the "body" of the let-expression (the e)
      => So the gap variable can use the three *earlier* variables.
       *)
      val gap = (year_gap, month_gap, day_gap)
  in
      case gap of
          (1, _, _) => true    (* 9 *)
        | (~1,_, _) => false   (* 9 *)
        | (0, 1, _) => true    (* 3 *)
        | (0,~1, _) => false   (* 3 *)
        | (0, 0, 1) => true    (* 1 *)
        | (0, 0, _) => false   (* 2 *)
        | (_, _, _) => false
          (* the last case, althought the three positions can have 27
           conditions, there is no use to do the last case, to avoid
           the "match nonexhaustive" warning, I adding that *)
  end;

fun is_older_2 ((x1, y1, z1), (x2, y2, z2)) =
  let
      fun sign x = if x > 0 then 1 else if x < 0 then ~1 else 0
      val year   = x2 - x1
      val month  = y2 - y1
      val day    = z2 - z1
  in
      case (sign year, sign month, sign day) of
          (1, _, _) => true
        | (~1,_, _) => false
        | (0, 1, _) => true
        | (0,~1, _) => false
        | (0, 0, 1) => true
        | (_, _, _) => false
  end;


val date1 = (2000, 1, 12);
val date2 = (1994, 7, 16);
val date3 = (1994, 7, 19);
val date4 = (2016, 9, 20);

val comp_1_and_4 = is_older (date1, date4);

val comp_3_and_2 = is_older (date3, date2);
val comp_4_itself = is_older (date4, date4);

val comp_1_and_4_2 = is_older_2 (date1, date4);
val comp_3_and_2_2 = is_older_2 (date3, date2);
val comp_4_itself_2 = is_older_2 (date4, date4);
