datatype suit = Club | Diamond | Heart | Spade;

datatype rank = Jack | Queen | King | Ace | Num of int;

type card = suit * rank;

type name_record = {student_num : int option,
                    first_name  : string,
                    middle_name : string option,
                    last_name   : string };


datatype id = StudentNum of int
            | Name of string * (string option) * string;

fun is_Queen_of_Spade (c : card) =
  #1 c = Spade andalso #2 c = Queen;

val c1 : card = (Diamond, Ace);
val c2 : suit * rank = (Heart, Ace);
val c3 = (Spade, Ace);


(* store for each student id-number (if they have one) and their full name *)
(*val student_record = {
  student_num : int option,
  first       : string,
  middle      : string option,
  last        : string
};*)

datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp;

fun eval (e : exp) =
  case e of
      Constant i => i
    | Negate e2  => ~ (eval e2)
    | Add(e1, e2) => (eval e1) + (eval e2)
    | Multiply(e1, e2) => (eval e1) * (eval e2);

val x = eval (Add (Constant 19, Negate (Constant 4)));

(* 0. The largest constant in an exprssion *)

(* Note: example as explained in video assums there is no library function
   for max of two ints. There is: Int.max *)

fun max_constant e =
  case e of
      Constant i       => i
    | Negate e2        => max_constant e2
    | Add(e1, e2)      => Int.max(max_constant e1, max_constant e2)
    | Multiply(e1, e2) => Int.max(max_constant e1, max_constant e2);


val test_exp = Add (Constant 19, Negate (Constant 4));
val nineteen = max_constant test_exp;

(* 1. A list of all the constants in an expression (use list append) *)
fun append (xs, ys) =
  case xs of
      [] => ys
    | x::xs' => x :: append(xs', ys);
(*
fun list_all_constants (e : exp) =
  let
      fun helper e =
        case e of
  in
  end;
*)

(* 2. A *bool* indicating whether there is at least one multiplication in the expression *)

(* 3. The number of addition expressions in an expression *)
fun number_of_adds e =
  case e of
      Constant i => 0
    | Negate e2 => number_of_adds e2
    | Add(e1, e2) => 1 + number_of_adds e1 + number_of_adds e2
    | Multiply(e1, e2) => number_of_adds e1 + number_of_adds e2;
