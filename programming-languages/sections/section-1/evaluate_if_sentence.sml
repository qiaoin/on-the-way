fun then_case x =
  print (x ^ "\n");

fun else_case x =
  print (x ^ "\n");

val test = if 2 > 3
           then then_case("then_case_involved")
           else else_case("else_case_involved");
