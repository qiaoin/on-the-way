type 'a foo = 'a ref;
val f : 'a -> 'a foo = ref;
val r = f NONE;

val pairWithOne = List.map (fn x => (x, 1));

fun pairWithOne2 xs = List.map (fn x => (x, 1)) xs;
