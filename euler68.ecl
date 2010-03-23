:- lib(ic).
:- lib(branch_and_bound).
:- import alldifferent/1 from ic_global.

euler68(Cost) :-
        constraints(Board, Cost),
        minimize(labeling(Board), Cost).
%        display_board(Board, Cost).

display_board(Board, Cost) :-
        printf("  %d\n    %d\n  %d   %d   %d\n%d\n", Board),
        printf("Total: %d\n", Cost).

constraints(Board, Cost) :-
        Board = [A, B, C, D, E, F, G, H, I, J],
        Board :: [1 .. 10],
        member(10, [A, C, I, J, F]),
        alldifferent(Board),
        Total #= A + B + E,
        Total #= F + D + B,
        Total #= G + H + I,
        Total #= H + E + C,
        Total #= D + G + J,
        A #< C,
        A #< I,
        A #< J,
        A #< F,
        Num = [A, B, E, D, E, H, I, H, G, J, G, D, F, D, B],
        n1th(I, Num, 10),
        Cost #= -C1*A - C2*B - C3*E - C4*D - C5*E - C6*H - C7*I - C8*H
                                                                     -
                C9*G - C10*J - C11*G - C12*D - C13*F - C14*D - B.

constraintsSample(Board, Cost) :-
        Board = [A, B, C, D, E, F],
        Board :: [1 .. 6],
        alldifferent(Board),
        A + B + D #= C + D + E,
        C + D + E #= B + C + F,
        A #< E,
        A #< F,
        Cost #= -A * 100000000 - B * 10000000 - D * 1000000 - E *
                 100000 - D * 10000 - C * 1000 - F * 100 - C * 10 - B.

n1th(1, [Elem | _], Elem) :- !.
n1th(I, [_ | Rest], Elem) :-
        I1 is I - 1,
        n1th(I1, Rest, Elem).