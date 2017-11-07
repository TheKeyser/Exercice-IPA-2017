program spirale;
  uses Graph; (*Permet d'utiliser les méthodes contenues dans l'unité Graph*)
  var
    mode,resolution : integer;

    procedure Spirale2(x,y,alpha,longueur: integer);
    begin
      MoveTo(x,y);
      LineTo((x+longueur), y);
      LineTo((x+longueur), (y + longueur));
      LineTo((x + alpha), (y + longueur));
      LineTo((x + alpha), (y + longueur - alpha))
    end;

begin
  mode := D8bit;
  resolution := m640x480;
  initgraph(mode,resolution,'');
  Spirale2(330,240,50,100);
  readln;
end.
