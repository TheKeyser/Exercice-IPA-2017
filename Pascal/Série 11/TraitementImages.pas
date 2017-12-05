program TraitementImages;
Uses image_utils;
 var
    ImagesLena: TImage;
procedure convertirenndg();
begin
end;
begin
  ImagesLena := open_image('lenna.png',512,512);
  ImagesLena.pixels[0,0].green := 0;
  writeln(ImagesLena.pixels[0,0].green);
  readln;
end.
