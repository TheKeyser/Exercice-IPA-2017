program TraitementImages;
Uses image_utils;
 var
    ImagesLena: TImage;
procedure convertirenndg(var Image: TImage);

begin
  Image.pixels[0,0].green := 0;
end;
begin
  ImagesLena := open_image('lenna.png',512,512);
  convertirenndg(ImagesLena);
  writeln(ImagesLena.pixels[0,0].green);
  readln;
end.
