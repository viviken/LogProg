member(H, [H|_]).
member(H, [_|Tail]):-member(H,Tail).

member1(H, [H|_],Res):-Res = true,!.
member1(H, [_|Tail],Res):-member1(H,Tail,Res).

accordance(A,B,A,B).
accordance(A,B,B,A).

/** <examples>
?- solve([["Дина",Дина],["Соня",Соня],["Коля",Коля],["Рома",Рома],["Миша",Миша]]).
*/

solve([["Дина",F1],["Соня",F2],["Коля",F3],["Рома",F4],["Миша",F5]]):-
    FList=[F1,F2,F3,F4,F5],
    member("Бойченко",FList),
    member("Савченко",FList),
    member("Карпенко",FList),
    member("Лысенко",FList),
    member("Шевченко",FList),
    not(member(F4,["Карпенко","Шевченко","Лысенко","Бойченко"])),
    not(accordance(F1,F3,"Лысенко","Бойченко")),
    not(accordance(F1,F3,"Карпенко","Шевченко")),
    member(F2,["Лысенко","Бойченко"]),
    not(F1 = "Карпенко"),
    not(member(F3,["Шевченко","Карпенко"])),
%%    member(F1,["Шевченко","Бойченко"])=member(F2,["Бойченко","Шевченко"])
	member1(F1,["Шевченко","Бойченко"],Res),
    member1(F2,["Шевченко","Бойченко"],Res)
%    ((F1="Шевченко",F2="Бойченко");(F2="Шевченко",F1="Бойченко");
%    (not(F1="Шевченко"),not(F1="Бойченко"),not(F2="Бойченко"),not(F2="Шевченко")))
    .

check(F2):-
    F2 = "Бойченко",
    F1 = "Шевченко",
	member1(F1,["Шевченко","Бойченко"],Res1),
    member1(F2,["Шевченко","Бойченко"],Res1)
    .