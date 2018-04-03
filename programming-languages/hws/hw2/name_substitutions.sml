(* Dan Grossman, CSE341, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
  s1 = s2;

(* put your solutions for problem 1 here *)
fun all_except_option (s : string, xs : string list) =
  let
      fun generate_help (target : string, test : string list, xs : string list) =
        (*
            target : judge the string in that list is the same as given string s
            test   : for each element in *test* string list, not the same with s
            xs     : the string list contains the string left
         *)
        if same_string (target, s)
        then SOME(test @ xs)
        else case xs of
                 [] => NONE
               | x::xs' => generate_help (x, target::test, xs')
  in
      case xs of
          [] => NONE
        | x::xs' => generate_help (x, [], xs')
  end;

(* test for all_except_option function *)
val s = "hello";
val xs1 = ["hello", "My", "name", "is", "Liubing", "!"];
val xs2 = ["You", "should", "say", "hello", "to", "everyone"];

val result1 = all_except_option (s, xs1);
val result2 = all_except_option (s, xs2);

fun get_substitutions1 (xs : string list list, s : string) =
  case xs of
      [] => []
    | x::xs' => case all_except_option (s, x) of
                   NONE => get_substitutions1 (xs', s)
                 | SOME lst => lst @ get_substitutions1 (xs', s);

(* test for get_substitutions1 function *)
val a = get_substitutions1 (
        [["Fred", "Fredrick"], ["Elizabeth","Betty"], ["Freddie", "Fred", "F"]],
        "Fred");
val b = get_substitutions1 (
        [["Fred", "Fredrick"], ["Jeff", "Jeffrey"], ["Geoff", "Jeff", "Jeffrey"]],
        "Jeff");

fun get_substitutions2 (xs : string list list, s : string) =
  let
      fun helper (xs : string list list, produce : string list) =
        case xs of
            [] => produce
          | x::xs' => case all_except_option (s, x) of
                         NONE => helper (xs', produce)
                       | SOME lst => helper (xs', produce @ lst)
  in
      helper (xs, [])
  end;

(* test for get_substitutions2 function *)
val a2 = get_substitutions2 (
        [["Fred", "Fredrick"], ["Elizabeth","Betty"], ["Freddie", "Fred", "F"]],
        "Fred");
val b2 = get_substitutions2 (
        [["Fred", "Fredrick"], ["Jeff", "Jeffrey"], ["Geoff", "Jeff", "Jeffrey"]],
        "Jeff");

fun similar_names (xs : string list list, {first=x, middle=y, last=z}) =
  let
      val first_list = get_substitutions2 (xs, x)
      fun generate_same_name (first_names : string list, produce) =
        case first_names of
            [] => produce
          | head::tail => generate_same_name (tail, {first=head, middle=y, last=z}::produce)
  in
      generate_same_name (first_list, [{first=x, middle=y, last=z}])
  end;

val samenames = similar_names (
        [["Fred", "Fredrick"], ["Elizabeth", "Betty"], ["Freddie", "Fred", "F"]],
        {first="Fred", middle="W", last="Smith"});
