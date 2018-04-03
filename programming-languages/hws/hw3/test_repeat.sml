fun is_repeat xs =
  case xs of
      [] => false
    | x::xs' => if List.exists (fn s => s=x) xs'
               then true
               else is_repeat xs'

val xs1 = ["hello", "my", "name", "is"];
val xs2 = ["NO", "YES", "NO", "I", "AM"];

val a = is_repeat xs1;
val b = is_repeat xs2;

datatype pattern = WildcardP
                 | VariableP of string
                 | UnitP
                 | ConstantP of int
                 | ConstructorP of string * pattern
                 | TupleP of pattern list;

fun pattern_to_list ps =
  case ps of
      VariableP x => x::[]
    | ConstructorP(_, ps') => pattern_to_list ps'
    | TupleP ps' => List.foldl (fn (p, i) => (i @ pattern_to_list(p)))
                              []
                              ps'
    | _ => []

val a = ConstructorP ("hello", VariableP "world");
val b = VariableP "my";
val c = WildcardP;
val d = VariableP "name";
val e = ConstantP 12;

val f = pattern_to_list (TupleP [a, b, c, d, e]);
