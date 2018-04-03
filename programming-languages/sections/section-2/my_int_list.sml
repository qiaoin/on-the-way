datatype my_int_list = Empty
                     | Cons of int * my_int_list;

val one_two_three = Cons(1, Cons(2, Cons(3, Empty)));

fun append_my_list (xs, ys) =
  case xs of
      Empty => ys
    | Cons(x, xs') => Cons(x, append_my_list(xs', ys));

val four = Cons(4, Empty);

val a = append_my_list(Empty, one_two_three);

val b = append_my_list(one_two_three, four);

fun inc_or_zero intoption =
  case intoption of
      NONE => 0
    | SOME i => i + 1;

val zero = inc_or_zero NONE;

val three = inc_or_zero(SOME 15);

fun sum_list xs =
  case xs of
      [] => 0
    | x :: xs' => x + sum_list xs';

fun append (xs, ys) =
  case xs of
      [] => ys
    | x::xs' => x :: append(xs', ys);

val a_list = [1, 2, 3, 4, 5, 6];

val b_list = [7, 8, 9, 10];

val sum = sum_list a_list;

val linked_list = append(a_list, b_list);
