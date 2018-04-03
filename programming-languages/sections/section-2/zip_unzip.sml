exception BadTriple;

fun zip3 list_triple =
  case list_triple of
      ([], [], []) => []
    | (hd1::tl1, hd2::tl2, hd3::tl3) => (hd1, hd2, hd3) :: zip3(tl1, tl2, tl3)
    | _ => raise BadTriple;

fun unzip3 lst =
  case lst of
      [] => ([], [], [])
    | (a, b, c) :: tail => let val (l1, l2, l3) = unzip3(tail)
                          in
                              (a::l1, b::l2, c::l3)
                          end;

val lst = zip3 ([1,2,3], [4,5,6], [7,8,9]);

val (a, b, c) = unzip3 lst;
