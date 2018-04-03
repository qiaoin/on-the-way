fun nondecreasing xs =
  case xs of
      [] => true
    | _::[] => true
    | head::(next::rest) => head <= next andalso nondecreasing (next::rest);

val a = nondecreasing [1, 2, 3, 4, 5];

datatype sgn = P | N | Z;

fun multsign (x1, x2) =
  let
      fun sign x = if x=0 then Z else if x>0 then P else N
  in
      case (sign x1, sign x2) of
          (Z, _) => Z
        | (_, Z) => Z
        | (P, P) => P
        | (N, N) => P
        | (N, P) => N
        | (P, N) => N
  end;

val b = multsign (0-1, 2);

fun len xs =
  case xs of
      [] => 0
    | _::xs' => 1 + len xs';
