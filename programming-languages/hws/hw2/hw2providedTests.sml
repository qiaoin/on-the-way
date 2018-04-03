(* Dan Grossman, CSE341, HW2 Provided Tests *)

(* These are just two tests for problem 2; you will want more.

   Naturally these tests and your tests will use bindings defined
   in your solution, in particular the officiate function,
   so they will not type-check if officiate is not defined.
 *)

use "solitaire_card_game.sml";

fun provided_test1 () = (* correct behavior: raise IllegalMove *)
    let val cards = [(Jack,Clubs),(Num(8),Spades)]
	val moves = [Draw,Discard(Jack,Hearts)]
    in
	officiate(cards,moves,42)
    end

fun provided_test2 () = (* correct behavior: return 5 *)
    let val cards = [(Ace,Clubs),(Ace,Spades),(Ace,Clubs),(Ace,Spades)]
	val moves = [Draw,Draw,Draw,Draw,Draw]
    in
 	officiate(cards,moves,42)
    end
