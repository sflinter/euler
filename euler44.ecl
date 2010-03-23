:- lib(ic).
:- lib(branch_and_bound).

solve(Vars, Cost) :-
        model(Vars, Cost),
        minimize(search(Vars, 0, first_fail, indomain_split, complete,
                        []), Cost).

pentagonals(Pents, N) :-
        ( foreach(Pent, Pents), count(I,1,N) do
            Pent #= I*(3*I-1)/2
        ).

model(Vars, M) :-
        Vars = [J, K],
        pentagonals(Pents, 20000),
        Vars :: Pents,
        [L, M] :: Pents,
        J + K #= L,
        J - K #= M.
