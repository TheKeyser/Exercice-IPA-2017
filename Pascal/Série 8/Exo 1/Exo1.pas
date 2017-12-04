program Exo1;
  var
  x, n: integer;
  function puissance_n(x, n: integer): integer;
    var
      i, compt: integer;
  begin
    compt := 1;
    for i := 1 to n do
      compt := x*compt;
    puissance_n := compt
  end;

begin
    writeln('coucou entrer x');
    readln(x);
    writeln('coucou entre n');
    readln(n);
    if (n < 0) then
      begin
        writeln(1/(puissance_n(x,(-n))));
      end
      else
          writeln(puissance_n(x, n));

    readln;
end.
