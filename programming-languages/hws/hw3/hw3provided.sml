(* Dan Grossman, CSE341, HW3 Provided Code *)

fun only_capitals xs =
  List.filter (fn s => Char.isUpper(String.sub(s, 0))) xs;

fun longest_string1 xs =
  List.foldl
      (fn (x, acc) => if String.size x > String.size acc
                   then x
                   else acc)
      ""
      xs;

fun longest_string2 xs =
  List.foldl
      (fn (x, acc) => if String.size x >= String.size acc
                   then x
                   else acc)
      ""
      xs;

(* test for 1, 2, 3 *)
val xs = ["Hello", "My", "Nammmmmmmme", "is", "Liu", "Bingo", "nice", "to", "Meet", "you"];

val a = only_capitals xs;
val b = longest_string1 xs;
val c = longest_string2 xs;

fun longest_string_helper f xs =
  List.foldl
      (fn (x, acc) => if f (String.size x, String.size acc)
                    then x
                    else acc)
      ""
      xs;

val longest_string3 = longest_string_helper
                          (fn (x, y) => x > y);
val longest_string4 = longest_string_helper
                          (fn (x, y) => x >= y);
val d = longest_string3 xs;
val e = longest_string4 xs;

val longest_capitalized = (longest_string1 o only_capitals);
val f = longest_capitalized xs;

val rev_string = (String.implode o rev o String.explode);

exception NoAnswer;

fun first_answer f xs =
  case xs of
      [] => raise NoAnswer
    | x::xs' => case f x of
                   NONE => first_answer f xs'
                 | SOME v => v;

fun all_answers f xs =
  let
      fun helper f xs acc =
        case xs of
            [] => acc
          | x::xs' => case f x of
                         NONE => helper f xs' acc
                       | SOME v => helper f xs' (acc@v)
  in
      case xs of
          [] => SOME []
        | _  => (* xs is not empty *)
          let
              val result = helper f xs []
          in
              case result of
                  [] => NONE
                | _  => SOME result
          end
  end;

datatype pattern = WildcardP
		 | VariableP of string
		 | UnitP
		 | ConstantP of int
		 | ConstructorP of string * pattern
		 | TupleP of pattern list;

datatype valu = Constant of int
	      | Unit
	      | Constructor of string * valu
	      | Tuple of valu list;

fun g f1 f2 p =
    let
	val r = g f1 f2
    in
	case p of
	    WildcardP         => f1 ()
	  | VariableP x       => f2 x
	  | ConstructorP(_,p) => r p
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | _                 => 0
    end;

(* 9 *)
val count_wildcards = g (fn () => 1) (fn x => 0);

val count_wild_and_variable_lengths =
    g (fn () => 1) (fn x => String.size x);

fun count_some_var (s, p) =
  g (fn () => 0) (fn x => if s=x then 1 else 0) p;

(* 10 *)
fun check_pat p =
  let
      fun pattern_to_list ps =
        case ps of
            VariableP x => x::[]
          | ConstructorP(_, ps') => pattern_to_list ps'
          | TupleP ps' => List.foldl (fn (p', i) => (i @ pattern_to_list(p')))
                                    []
                                    ps'
          | _ => []
      fun is_repeat xs =
        case xs of
            [] => false
          | x::xs' => if List.exists (fn s => s=x) xs'
                     then true
                     else is_repeat xs'
                     (*
                     检查一个列表中是否有重复元素：每次检查第一个元素是否在剩余元素中有重复
                     1. 如果其在剩余元素中出现过，返回True;
                     2. 如果未出现，那在接下来的比较中，可以仅比较剩余列表中是否有重复元素
                     *)
  in
      not((is_repeat o pattern_to_list) p)
  end;

val a = ConstructorP ("hello", VariableP "world");
val b = VariableP "my";
val c = WildcardP;
val d = VariableP "name";
val g = ConstructorP ("world", VariableP "world");
val e = ConstantP 12;

val p_tuple = TupleP [a, b, c, d, e];

val v_a = Constructor ("Hello", Unit);
val v_b = v_a;
val v_c = Unit;
val v_d = v_a;
val v_e = Constant 12;
val v_tuple = Tuple [v_a, v_b, v_c, v_d, v_e];

val f = check_pat (TupleP [a, b, c, d, e]);
val h = check_pat (TupleP [a, b, c, d, e, g]);

(* 11 *)
fun match (value, p) =
  case (value, p) of
      (_, WildcardP) => SOME []
    | (v, VariableP s) => SOME ((s, v)::[])
    | (Unit, UnitP) => SOME []
    | (Constant v2, ConstantP v1) => if v1=v2 then SOME [] else NONE
    | (Constructor(s2, v), ConstructorP(s1, p)) =>
      let
          val remaind = match (v, p)
          val next = case remaind of
                         NONE => false
                       | SOME _ => true
      in
          if s1=s2 andalso next
          then remaind
          else NONE
      end
    | (Tuple vlist, TupleP plist) => all_answers
                                        match
                                        (ListPair.zip(vlist, plist))
    | _ => NONE;

val v = Constructor ("world", Constant 10);
val hello = match (v, g);

val twelve = match (Constant 12, ConstantP 12);

val test_tuple = match (v_tuple, p_tuple);

(* 12 *)
fun first_match (value, ps) =
  let
      val result = (first_answer
                       match
                       (List.foldl
                            (fn (p, acc) => (value, p)::acc)
                            []
                            ps)
                   ) handle NoAnswer =>
                                        (print "exception occur\n"; [])
  in
      case result of
          [] => NONE
        | _ => SOME result
  end;

val p_list = [a, b, d, e, g];
val test_first = first_match (Constant 12, p_list);
val test_variable = first_match (Constructor("world", Constant 12), p_list);

val p_list_2 = [UnitP, UnitP, ConstantP 12];
val pair_list = (List.foldl
                        (fn (p, acc) => (Constant 12, p)::acc)
                        []
                        p_list_2);
val test_two = first_answer match pair_list;

val combine = first_match (Constant 13, p_list_2);

(**** for the challenge problem only ****)

datatype typ = AnythingT
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | DatatypeT of string;

(**** you can put all your code here ****)
