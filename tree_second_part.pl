/** <examples>
?- check("@I5579@","@I5580@").
*/

father1(Name, 0,Name).
mother1(Name, 0,Name).

father1(Name, Index, Name2):-
    NewIndex is Index - 1,
    father(Name3, Name),
    father1(Name3, NewIndex ,Name2).

mother1(Name, Index, Name2):-
    NewIndex is Index - 1,
    mother(Name3, Name),
    mother1(Name3, NewIndex ,Name2).
	
check(Name1, Name2):-
	father1(Name1, 3, F1),
    father1(Name2, 3, F2),
	mother1(Name1, 3, M1),
    mother1(Name2, 3, M2),
    (F1 = F2;M1 = M2),
    !
.