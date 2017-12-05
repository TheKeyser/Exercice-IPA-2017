program TraitementImages;
Uses image_utils;
 var
    ImagesLena: TImage;
procedure convertirenndg(var Image: TImage);
  var
    i : integer;
    j : integer;
begin
  for i:= 0 to 511 do begin
    for j:= 0 to 511 do begin
      writeln(Image.pixels[i,j].green)
    end;
  end;

end;
begin
  ImagesLena := open_image('lenna.png',512,512);
  convertirenndg(ImagesLena);
  writeln(ImagesLena.pixels[0,0].green);
  readln;
end.
