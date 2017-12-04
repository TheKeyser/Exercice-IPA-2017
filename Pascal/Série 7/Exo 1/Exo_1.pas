program Exo1;
  var
    x : integer;
    i: integer;
  procedure test();
  begin
    x := 0;
  end;
begin
  x := 3;
  for i := 65 to 90 do
    writeln(chr(i));

  test();
  writeln(x);
  readln;

end.
