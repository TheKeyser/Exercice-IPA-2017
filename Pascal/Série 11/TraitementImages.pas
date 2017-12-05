program TraitementImages;
Uses image_utils;
 var
    ImagesLena: TImage;
procedure convertirenndg(var Image: TImage);
  var
    i : integer;
    j : integer;
    g : integer;
begin
  for i:= 0 to 511 do begin
    for j:= 0 to 511 do begin
      g := trunc(0.3*Image.pixels[i,j].red + 0.59*Image.pixels[i,j].green + 0.11*Image.pixels[i,j].blue);
      Image.pixels[i,j].red := g;
      Image.pixels[i,j].green := g;
      Image.pixels[i,j].blue := g;
    end; {for}
  end; {for}
end; {procedure}

begin
  ImagesLena := open_image('lenna.png',512,512);
  convertirenndg(ImagesLena);
save_image('lennagris.png', ImagesLena);
  readln;
end.
